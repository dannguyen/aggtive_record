module AggtiveRecord
  module Aggable
    extend ActiveSupport::Concern


    included do 
      include AggtiveRecord::EggScopes::TimeBucket
      include AggtiveRecord::EggScopes::TimeSpan
      include AggtiveRecord::EggScopes::Collation

      class_attribute :datetime_attribute
    end

    module ClassMethods
      def attr_datetime(attname)
        raise ArgumentError unless is_a_datetime?(attname)
        self.datetime_attribute = attname 
      end

      def is_a_datetime?(attname)
        self.columns.select{|r| r.name == attname.to_s && r.type =~ /date|time/}.first.present?
      end
    end


  end
end