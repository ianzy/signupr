class GuestEvent < ActiveRecord::Base
  attr_accessible :event_id, :guest_id, :is_checked_in, :is_gift_picked, :is_signed_up, :type
  belongs_to :event
  belongs_to :guest
  has_many :guest_event_logs
  
  def as_json(options={})
    {
      :id => self.id,
      :guest_id => self.guest_id,
      :guest => {
        :id => self.guest.id,
        :first_name => self.guest.first_name,
        :last_name  => self.guest.last_name,
        :phone => self.guest.phone,
        :email => self.guest.email,
        :first_name_cn =>  self.guest.first_name_cn,
        :last_name_cn  =>  self.guest.last_name_cn,
        :note =>  self.guest.note,
        :created_at =>  self.guest.created_at,
        :updated_at =>  self.guest.updated_at
      },
      :event_id => self.event_id,
      :type => self.type,
      :is_signed_up => self.is_signed_up,
      :is_gift_picked => self.is_gift_picked,
      :is_checked_in => self.is_checked_in,
      :created_at => self.created_at,
      :updated_at => self.updated_at
    }

  end
end
