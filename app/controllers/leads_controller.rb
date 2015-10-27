class LeadsController < ApplicationController

  def index
    @leads = Lead.order(:created_at)
  end

  def create
    lead = Lead.new(lead_params)
    lead.save

    redirect_to leads_path(:trailing_slash=>true)
  end

  private
  def lead_params
    params.require(:lead).permit(:description, :customer_name, :customer_phone, :scheduled_time, :value)
  end


end