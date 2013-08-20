require 'spec_helper'

describe "AggtiveRecord::Aggable" do

  context 'class methods' do 

    describe '#is_a_datetime?' do 
      it 'returns true if named column exists and is date/time' do 
        @klass.is_a_datetime?
      end

      it 'returns false if named column does not exist'
      it 'returns false if named column is not date/time'
    end


    describe '#attr_datetime' do 
      it 'sets @@datetime_attribute'
      it 'raises ArgumentError if not a valid datetime column'
    end

  end

end
