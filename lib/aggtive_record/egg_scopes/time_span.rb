# defines named_scopes
module AggtiveRecord
  module EggScopes
    module TimeSpan

      extend ActiveSupport::Concern
        

      included do 


        scope :past_time_periods, ->(num, period_name){ where("#{self.datetime_attribute} >= ?", num.send(period_name).send(:ago)  ) }

        # just include all records
        scope :overall, ->(){ where("#{self.datetime_attribute} IS NOT ?", nil) }

        # singular time periods       
        # e.g. scope :past_year, ->{ past_time_periods(1, :year)}
        AggtiveRecord::Time.periods.each do |period_name|          
          foo_name = "past_#{period_name}".to_sym
          # defining scope here, dynamically
          scope foo_name, ->{
            send( :past_time_periods, 1, period_name )
          }         
        end 


        # some custom time periods
        # e.g. :past_14_days, :past_30_days

        [[14, 'day'], [30, 'day'], [6, 'month']].each do |p_arr|
          num, period = p_arr
          foo_name = "past_#{num}_#{period.pluralize}"
          scope foo_name, ->{
            send( :past_time_periods, num, period)
          }

        end

        

      end
    end
  end
end