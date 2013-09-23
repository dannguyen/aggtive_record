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
          def rate_per(time_period)
            time_period_secs = AggtiveRecord::Time.to_seconds(time_period)
            records = self.scoped.to_a

            return records.size.to_f * time_period_secs / self.timespan_to_now(records)
          end
        end

      end
    end
  end
end

=begin
 
Record.rate_per :hour
      .rate_per :day


=end
