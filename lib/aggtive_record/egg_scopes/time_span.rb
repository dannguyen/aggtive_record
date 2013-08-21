module AggtiveRecord
  module EggScopes
    module TimeSpan

      extend ActiveSupport::Concern
    

      included do 


        scope :past_time_periods, ->(num, period_name){ where("#{self.datetime_attribute} >= ?", num.send(period_name).send(:ago)  ) }

       
        # e.g. scope :past_year, ->{ past_time_periods(1, :year)}
        AggtiveRecord::Time.periods.each do |period_name|          
          foo_name = "past_#{period_name}".to_sym
          # defining scope here, dynamically
          scope foo_name, ->{
            send( :past_time_periods, 1, period_name )
          }         
        end 


        

      end


    end
  end
end