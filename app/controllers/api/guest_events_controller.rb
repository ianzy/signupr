class Api::GuestEventsController < Api::BaseController
  
  def collection
    return super.includes(:guest).where(:event_id => params[:event_id]) if params[:event_id]
    super.includes(:guest)
  end
  
  def get_guests_for_event
    guest_events = GuestEvent.includes(:guest).where(:event_id => params[:event_id])
    raise RecordNotFound if guest_events.nil? 
    
    requested_options = params.only("page", "per_page").symbolize_keys
    default_pagination_options = {:page => 1, :per_page => 10}.merge(requested_options)
    guest_events = guest_events.page(default_pagination_options[:page]).per(default_pagination_options[:per_page])
    
    respond_to do |format|
      format.json do
        render :json => { :data => guest_events, :paging => pagination_data(guest_events) }
      end
    end
  end
  
  def get_logs_for_guest_event
    guest_event = GuestEvent.find_by_id(params[:id])
    raise RecordNotFound if guest_event.nil?
    logs = guest_event.guest_event_logs
    raise RecordNotFound if logs.nil? || logs.empty?
    
    default_pagination_options = {:page => 1, :per_page => 10}.merge(requested_options)
    logs.page(default_pagination_options[:page]).per(default_pagination_options[:per_page])
    
    respond_to do |format|
      format.json do
        render :json => { :data => logs, :paging => pagination_data(logs) }
      end
    end
  end
  
end