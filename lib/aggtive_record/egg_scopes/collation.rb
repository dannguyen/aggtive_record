require_relative 'collation/count_by'
require_relative 'collation/rate_per'

module AggtiveRecord
  module EggScopes
    module Collation
      extend ActiveSupport::Concern
      include CountBy
      include Rate
    
      module ClassMethods
        # Public: a helper
        # sorts the records after ActiveRecord query, ascending
        #
        # Returns a mapped array of timestamps
        def enumerable_asc_sort(records)
          records.map{|r| r.send(self.datetime_attribute)}.sort 
        end

        def earliest_time_of(records)
          enumerable_asc_sort(records).first
        end

        def latest_time_of(records)
          enumerable_asc_sort(records).last
        end

        # Public: 
        #   records: An ActiveRecord collection
        #
        # Returns the number of seconds
        # TODO - eliminate use of helper methods
        def timespan_of(records)
          latest_time_of(records) - earliest_time_of(records)
        end

        def timespan_to_now(records)
          return 0 if records.empty? || records.nil?
          ::Time.now - earliest_time_of(records)
        end

      end


    end
  end
end

