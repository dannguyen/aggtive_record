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

          # define dynamically
          AggtiveRecord::Time.periods.each do |period_name|          
            foo_name = "count_by_#{period_name}".to_sym
            # defining scope here, dynamically
            define_method foo_name do
              self.count_by(period_name)
            end
          end
        end



      end
    end
  end
end