require 'groupdate'
module AggtiveRecord
  module EggScopes
    module TimeBucket
      extend ActiveSupport::Concern

      included do 
        #TODO: refactor
        scope :by_year, ->{group_by_year(self.datetime_attribute)}
        scope :by_month, ->{group_by_month(self.datetime_attribute)}
      end
    

    end
  end
end