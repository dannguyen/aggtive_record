module AggtiveRecord
  module Aggable
    extend ActiveSupport::Concern

    included do 
      class_attribute :datetime_attribute
    end

    module ClassMethods
      def attr_timestamp(attname)
        raise ArgumentError unless is_a_datetime?(att)
        self.datetime_attribute = attname 
      end

      def is_a_datetime?(attname)
        self.columns.select{|r| r.name == attname.to_s && r.type =~ /date|time/}.first.present?
      end
    end


    def method_missing

    end

    def respond_to

    end
  end
end