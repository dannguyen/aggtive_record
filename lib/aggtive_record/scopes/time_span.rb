module AggtiveRecord
  module Scopes
    module TimeSpan

      extend ActiveRecord::Concern
      
      # where("#{}" => 1.year.ago..Time.now)
      #past_year

      mattr_reader :prefix
      self.prefix = 'during'

=begin
 
  
  
=end


    end
  end
end