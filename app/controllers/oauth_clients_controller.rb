class OauthClientsController < ApplicationController
  # before_filter :login_required
  before_filter :get_client_application, :only => [:show, :edit, :update, :destroy]

  def index
    @client_applications = ClientApplication.all
    @tokens = []
    # @tokens = current_user.tokens.find :all, :conditions => 'oauth_tokens.invalidated_at is null and oauth_tokens.authorized_at is not null'
  end

  def new
    @client_application = ClientApplication.new
  end

  def create
    @client_application = ClientApplication.create(params[:client_application])
    if @client_application.save
      flash[:notice] = "Registered the information successfully"
      redirect_to :action => "show", :id => @client_application.id
    else
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @client_application.update_attributes(params[:client_application])
      flash[:notice] = "Updated the client information successfully"
      redirect_to :action => "show", :id => @client_application.id
    else
      render :action => "edit"
    end
  end

  def destroy
    @client_application.destroy
    flash[:notice] = "Destroyed the client application registration"
    redirect_to :action => "index"
  end

  private
  def get_client_application
    unless @client_application = ClientApplication.find(params[:id])
      flash.now[:error] = "Wrong application id"
      raise ActiveRecord::RecordNotFound
    end
  end
end
