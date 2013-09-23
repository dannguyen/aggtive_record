module AggtiveRecord
  module EggScopes
    module Collation
      module CountBy 
        extend ActiveSupport::Concern

        # Public: convenience for #by_:time_period and #count
        # self is a ActiveRecord scope

        module ClassMethods
          def count_by(time_period)
            span_foo = "by_#{time_period}"
            self.send(span_foo).count
          end
        end

      end
    end
  end
end