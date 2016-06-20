class BillingController < ApplicationController
  
  def new
    @medicine = Medicine.available_medicines
   
  end
  
  def load_quantity
   @medicines = Medicine.find(params[:medicine_id])
  end
  
  def view_member
    
    @medname=Medicine.find_by_id(params[:name]).medicine_name
      
    @avqu= params[:avquantity]
    @qua= params[:quantity]    
      
  end
  
  
end
