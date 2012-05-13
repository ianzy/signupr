class Guest < ActiveRecord::Base
  attr_accessible :email, :first_name, :first_name_cn, :last_name, :last_name_cn, :note, :phone
  has_many :guest_events
  has_many :events, :through => :guest_events
end
