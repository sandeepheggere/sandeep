require 'csv'

class Medicine < ActiveRecord::Base
  named_scope :available_medicines, {:conditions => ["quantity > ?",0]}
   
    #def self.update_stock
     # c=CSV.read("/home/madhuri/medicines1.csv")
     # CSV.foreach('/home/madhuri/medicines1.csv') do |row1|
      #  puts row1.inspect
      #end
    #end
    
  def Medicine.migrate_specimen_nayati_pavan
    filename = RAILS_ROOT + "/db/111111.csv"
           file = File.new(filename,"r")
           while(line = file.gets)
             columns = line.split("$")
             mad = Medicine.find(:first, :conditions => ["lower(medicine_name) =?",columns[0].to_s.chomp.strip.squeeze(" ").downcase])
       
       if !mad.blank?
         
         mad.update_attributes(:price =>columns[3].to_s.chomp.strip.squeeze(" ").downcase)
         mad.save!
       end
       end
   end
   
   def Medicine.alter_price
     @mad = Medicine.find(:all, :conditions => ["quantity < ?",'50'])
       for mad in @mad
       #raise [mad.quantity].inspect
       mad.update_attributes(:quantity => mad.quantity + 2 )
       end
       
   end
   
   def Medicine.update_price
     @mad=Medicine.find(:all,:conditions => ["price > ?",'100'])
       for mad in @mad
         mad.update_attributes(:price => mad.price - 2)
       end
end
end
#mad = Medicine.find(:first, :conditions => ["quantity =?",columns[1].to_i])
           
   # if mad.quantity < 5
     # mad.update_attributes(:quantity =>columns[1].to_i + 2)
   
   
#@medicine = Medicine.all
#for medicine in @medicine
#  Medicine.find_by_medicine_name(medicine.medicine_name)
#end

