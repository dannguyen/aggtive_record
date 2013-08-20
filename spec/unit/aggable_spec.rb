require 'spec_helper'

describe "AggtiveRecord::Aggable" do

  context 'class methods' do 

    describe '#is_a_datetime?' do 
      it 'returns true if named column exists and is date/time' do 
        expect(MusicRecord.is_a_datetime?(:published_at)).to be_true
      end

      it 'returns false if named column does not exist' do 
        expect(MusicRecord.is_a_datetime?(:not_a_column)).to be_false
      end


      it 'returns false if named column is not date/time' do 
        expect(MusicRecord.is_a_datetime?(:title)).to be_false
      end
    end


    describe '#attr_datetime' do 
      it 'sets @@datetime_attribute' do 
        MusicRecord.attr_datetime :published_at
        expect(MusicRecord.datetime_attribute).to eq :published_at
      end

      it 'raises ArgumentError if not a valid datetime column' do 
        expect{MusicRecord.attr_datetime :title}.to raise_error ArgumentError
      end
    end

  end

end
