module AggtiveRecord
  module EggScopes
    module Collation
      extend ActiveSupport::Concern

      # Public: a rate
      # expects that ActiveRelation has a grouping
      # self is a ActiveRecord scope

      module ClassMethods
        def rate_per(time_period)
          span_foo = "by_#{time_period}"
          self.send(span_foo).count
        end


        def earliest 

        end

      end


    end
  end
end