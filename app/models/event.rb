class Event < ApplicationRecord

  belongs_to :user

  validates :name, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :total_needed, presence: true
  validates :location, presence: true


end
