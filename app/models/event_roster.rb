class EventRoster < ApplicationRecord

  belongs_to :user
  belongs_to :event

  validate :not_on_roster, on: :create

  validates :user_id, presence: true
  validates :event_id, presence: true

  scope :approved, -> {where(status: 'approved')}
  scope :pending, -> {where(status: 'pending')}
  scope :denied, -> {where(status: 'denied')}

  def approved_by_user
    User.find(approved_by).display_name
  end

  private

  def not_on_roster
    if EventRoster.where(user_id: user_id).where(event_id: event_id).present?
      errors.add(:uniqueness, 'You are already a member of this roster')
    end
  end

end
