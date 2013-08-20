require 'squeel'

module AggtiveRecord
  module EggScopes
    module TimeSpan

      extend ActiveSupport::Concern
    

      included do 

        scope :past_year, ->{ where(my(datetime_attribute) >= 1.year.ago) }

      end


    end
  end
end