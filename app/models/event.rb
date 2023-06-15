class Event < ApplicationRecord
    scope :upcoming -> {where("event_date >= ?", Time.now)}
    scope :past -> {where("event_date <= ?", Time.now)}

    belongs_to :host, class_name: 'User'
    
    has_many :attendances
    has_many :attendees, through: :attendances
end
