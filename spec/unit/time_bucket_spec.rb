require 'spec_helper'

describe AggtiveRecord::EggScopes::TimeBucket do 


  describe '#by' do 

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

    context 'discrete time periods' do
      it 'groups #by_year' do 
        @group = MusicRecord.by_year.
                              count.select{|k,v| k.year == 2010}.first
        expect(@group[1]).to eq 2
      end

      it 'groups #by_month' do 
        @group = MusicRecord.by_month.
                              count.select{|k,v| k.year == 2012 && k.month == 5}.first
        expect(@group[1]).to eq 2
      end

    end



  end
end
