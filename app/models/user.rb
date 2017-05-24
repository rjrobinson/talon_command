class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :event_rosters
  has_many :events, through: :event_rosters

  has_one :profile

  def display_name
    email
  end

  def create_profile
    Profile.create(user_id: id) if profile.nil?
  end
end
