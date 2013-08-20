require 'spec_helper'

describe AggtiveRecord::EggScopes::TimeSpan do 


  describe '#in...' do 
    before(:each) do 
      @a = MusicRecord.create(
        published_at: "2010-01-20"
      )
      
      @b = MusicRecord.create(
        published_at: "2010-03-12"
      )

      @c = MusicRecord.create(
        published_at: "2012-05-12"
      )

      @d = MusicRecord.create(
        published_at: "2012-05-12"
      )
    end


    describe '#past...' do 
      context 'singular periods' do 
        it 'should span a #year'
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