module AggtiveRecord
  module Scopes
    module TimeBucket
      extend ActiveRecord::Concern

      mattr_reader :prefix
      self.prefix = 'by'
    

    end
  end
end