class SubscriptionsController < ApplicationController
  def subscribe
    ## Find subscription
    s = Subscription.where("user_id = ? AND category_id= ?", params[:user_id], params[:category_id])
    ## If it's empty then make new Subscription ans save
    if s.empty?
      sub= Subscription.new(user_id: params[:user_id], category_id: params[:category_id])
      respond_to do |format|
        if sub.save
          format.json { render json: sub }
        else
          format.json { render json: sub.errors, status: :unprocessable_entity } 
        end
      end  
    else
      s.first.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end  
  end
end
