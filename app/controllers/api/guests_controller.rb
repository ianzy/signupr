class Api::GuestsController < Api::BaseController
  
  def get_events_for_guest
    guest = Guest.where(:id => params[:id])
    raise RecordNotFound if guest.nil?
    events = user.events
    raise RecordNotFound if events.nil? || events.empty?
    
    requested_options = params.only("page", "per_page").symbolize_keys
    default_pagination_options = {:page => 1, :per_page => 10}.merge(requested_options)
    events = events.page(default_pagination_options[:page]).per(default_pagination_options[:per_page])
    
    respond_to do |format|
      format.json do
        render :json => { :data => events, :paging => pagination_data(events) }
      end
    end
  end
  
end