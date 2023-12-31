class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hosted_events, class_name: 'Event', foreign_key: 'host_id', dependent: :destroy

  has_many :attendances, foreign_key: 'attendee_id', dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event
end
