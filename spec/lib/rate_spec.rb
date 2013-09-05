require 'spec_helper'

describe "AggtiveRecord::EggScopes -- .rate" do


    describe '#rate_for' do 
      context 'singular periods' do 
        it 'should span a #year' do 
          @record = MusicRecord.create published_at: 4.months.ago
          MusicRecord.create published_at: 14.months.ago

          expect(MusicRecord.rate_per(:year) ).to eq 1
        end
      end
    end
  

end