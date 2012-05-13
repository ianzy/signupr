class Event < ActiveRecord::Base
  attr_accessible :end_time, :event_name, :note, :organizer_name, :start_time
  has_many :guest_events
  has_many :guests, :through => :guest_events
end
