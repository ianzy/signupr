class Api::EventsController < Api::BaseController
  
  def get_guests_for_event
    event = Event.where(:id => params[:id])
    raise RecordNotFound if event.nil?
    guests = event.guests
    raise RecordNotFound if guests.nil? || guests.empty?
    
    requested_options = params.only("page", "per_page").symbolize_keys
    default_pagination_options = {:page => 1, :per_page => 10}.merge(requested_options)
    guests = guests.page(default_pagination_options[:page]).per(default_pagination_options[:per_page])
    
    respond_to do |format|
      format.json do
        render :json => { :data => guests, :paging => pagination_data(guests) }
      end
    end
  end
  
end