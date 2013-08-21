require 'spec_helper'

describe AggtiveRecord::EggScopes::TimeSpan do 


  describe '#in...' do 
    before(:each) do 

    end


    describe '#past...' do 
      context 'singular periods' do 
        it 'should span a #year' do 
          @record = MusicRecord.create published_at: 4.months.ago
          MusicRecord.create published_at: 2.years.ago
          expect(MusicRecord.past_year.count).to eq 1
        end

        it 'should span a #month'
        it 'should span an #hour'
      end

      context 'plural periods' do 
        it 'should span #10_years'
      end    
    end


    describe 'just period name' do 
      context 'single argument' do 
        it 'spans #year(1999)'
      end
    end

  end
end