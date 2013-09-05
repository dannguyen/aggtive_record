# defines named_scopes

require 'groupdate'
module AggtiveRecord
  module EggScopes
    module TimeBucket
      extend ActiveSupport::Concern

      included do 
        #TODO: refactor

        # create a method for each type of groupdate
        # e.g. by_year == group_by_year(datetime_attribute)
        AggtiveRecord::Time.periods.each do |bucket_name|          
          agg_foo_name = "by_#{bucket_name}".to_sym
          groupdate_foo_name = "group_#{agg_foo_name}".to_sym
          
          # defining scope here, dynamically
          scope agg_foo_name, ->(*args){
            send( groupdate_foo_name, self.datetime_attribute )
          }         
        end 


      end
    

    end
  end
end