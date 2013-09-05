require 'spec_helper'

describe "AggtiveRecord::EggScopes -- .rate" do


    describe '#rate_for' do 
      context 'singular periods' do 
        it 'should span a #year' do 
          @record = MusicRecord.create published_at: 4.months.ago
          MusicRecord.create published_at: 14.months.ago

          expect(MusicRecord.rate_per(:year) ).to eq 1
        end

        
        it 'should raise an error when a non-time period is passed in'
        it 'should play nicely with other methods'
      end


      context 'helper methods' do 

        it 'should get #earliest record in a set without re-querying database'
        it 'should get #latest record in a set without re-querying database'

      end

    end
  

end