require 'oauth'
class Api::BaseController < ApplicationController
  inherit_resources
  
  actions :all, :except => %w( edit new )
  
  include OAuth::Controllers::ApplicationControllerMethods
  oauthenticate :strategies => :two_legged, :interactive => false
  
  respond_to :json, :xml
  
  # standardized exception handling
  [
    {:klass => InvalidParameters, :status => 422, :errors => ['invalid parameters']},
    {:klass => ActiveRecord::RecordNotFound, :status => 404, :errors => ['not found']}
  ].each do |h|
    rescue_from h[:klass] do |e|
      render_errors_json(h[:errors], h[:status])
    end
  end
  
  def index
    respond_to do |format|
      format.json do
        render :json => { :data => collection, :paging => pagination_data(collection) }
      end
    end
  end
  
  def show
    respond_to do |format|
      format.json do
        render :json => { :data => resource, :paging => nil }
      end
    end
  end
  
  # use pagination for all collections
  def collection
    requested_options = params.only("page", "per_page").symbolize_keys
    default_pagination_options = {:page => 1, :per_page => 10}.merge(requested_options)

    collection = get_collection_ivar || set_collection_ivar(end_of_association_chain)
    collection.page(default_pagination_options[:page]).per(default_pagination_options[:per_page])
  end
  
  protected  
  def render_errors_json(errors, status)
    render :json => {'errors' => errors.map{|x| {'error' => x}}}, :status => status
  end
  
  def pagination_data(collection)
    return {} unless collection && collection.respond_to?(:current_page)
    {
      :current_page => collection.current_page,
      :per_page => collection.limit_value,
      :total_count => collection.total_count,
      :num_pages => collection.num_pages
    }
  end
end