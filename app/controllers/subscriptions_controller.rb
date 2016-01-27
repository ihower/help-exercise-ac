class SubscriptionsController < ApplicationController
  before_action :set_message
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    Subscription.create!( :message => @message, :user => current_user )
    redirect_to :back
  end

  def destroy
    subscription = current_user.subscriptions.find( params[:id] )
    subscription.destroy

    redirect_to :back
  end
end
