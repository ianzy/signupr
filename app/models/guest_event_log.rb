class GuestEventLog < ActiveRecord::Base
  attr_accessible :guest_event_id, :log_details, :log_type
end
