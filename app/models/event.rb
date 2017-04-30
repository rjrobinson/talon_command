class Event < ApplicationRecord

  belongs_to :user

  has_many :event_rosters
  has_many :users, through: :event_rosters

  validates :name, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :total_needed, presence: true
  validates :location, presence: true


  def approved
    self.event_rosters.approved
  end


  def pending
    self.event_rosters.pending
  end
end
