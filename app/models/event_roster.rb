class EventRoster < ApplicationRecord

  belongs_to :user
  belongs_to :event

  validate :not_on_roster


  scope :approved, -> {where(approved: true)}
  scope :pending, -> {where(status: 'pending')}


  private

  def not_on_roster
    if EventRoster.where(user_id: user_id).where(event_id: event_id).present?
      errors.add(:uniqueness, 'You are already a member of this roster')
    end
  end

end
