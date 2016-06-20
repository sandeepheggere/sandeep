require 'csv'
class MedicinesController < ApplicationController
  
  def index
    @medicines=Medicine.find(:all)
   end
   
   def new
   end
   
   def create
     @medicines=Medicine.new(params[:medicines])
       if @medicines.save
         redirect_to :action => "index"
       else
         render :action => "new"
       end
   end
  
   def upload_stock
   end
   
   def save_upload_stock
     c = CSV.read("/home/madhuri/medicines.csv")
     recent_customers= CSV.read('/home/madhuri/medicines.csv',col_sep: ',', converters: :numeric)
    # CSV.foreach('/home/madhuri/medicines.csv', { :col_sep => ',' }) { |row| p row }
    # customers = CSV.read('/home/madhuri/eclipse_workspace/pharma/public/images/medicines.csv')
     CSV.foreach('/home/madhuri/medicines.csv') do |row1|
       m = Medicine.new
        m.medicine_name = row1[0]
        m.quantity = row1[1]
        m.expiry_date = row1[2]
        m.save
     end
     redirect_to :action => :upload_stock
   end
end



