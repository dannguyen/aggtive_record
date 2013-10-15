module AggtiveRecord
  module EggScopes
    module Collation
      module Rate 
        extend ActiveSupport::Concern

        # Public: a rate
        # expects that ActiveRelation has a grouping
        # self is a ActiveRecord scope

        module ClassMethods

          # Public
          #
          # Returns float indicating rate of records per given time period
          def rate_per(time_period, timespan_in_seconds = nil)

            # tk: this may be unnecessary
            records = self.scoped.to_a

             #e.g. whatever is passed in, or all of them from the beginning to end of reconrds
            timespan_in_seconds ||= self.timespan_to_now(records)

            # return 0 if no timespan_in_seconds
            return 0 if timespan_in_seconds.to_i ==0

            # eg. :hour is 3600 seconds
            time_period_in_secs = AggtiveRecord::Time.to_seconds(time_period)
                    
            return records.size.to_f * time_period_in_secs / timespan_in_seconds
          end

          # defines rate_per_year, rate_per_hour
          # except that rate_per_year also accepts an optional argument
        
          AggtiveRecord::Time.periods.each do |period_name|          
            foo_name = "rate_per_#{period_name}".to_sym
            # defining scope here, dynamically
            define_method foo_name do |*args|              
              if args[0].present? && args[0] !~ /^overall$/
              # i.e: #rate_per_month(:past_year)
                past_scope = args[0]  # past_year, :overall
                raise ArgumentError, "Must be a scope with 'past_' or 'overall'" unless past_scope.to_s =~ /^past_/

                time_scoped_records = self.send( past_scope )
                past_time_span_name = past_scope.to_s.match(/past_(\w+)/)[1]
                past_period_in_seconds = AggtiveRecord::Time.to_seconds(past_time_span_name)
              else # overall or no argument
                time_scoped_records = scoped
                past_period_in_seconds = self.timespan_to_now(time_scoped_records)
              end

#              puts "Past #{past_time_span_name} in seconds: #{past_period_in_seconds}"
              time_scoped_records.send( :rate_per, period_name, past_period_in_seconds )
            end
          end 
        end


        # included do 

        #   # singular time periods       
        #   # e.g. scope :past_year, ->{ past_time_periods(1, :year)}
          

        # end

      end
    end
  end
end

=begin
 
Record.rate_per :hour
      .rate_per :day


=end
