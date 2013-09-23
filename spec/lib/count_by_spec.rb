require 'spec_helper'

describe AggtiveRecord::EggScopes::Collation::CountBy do 
  describe '#count_by' do 

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
        published_at: "2012-05-12 15:00"
      )
    end

    context 'basic groupdate usage' do
      it 'can #count_by_year' do 
        a = MusicRecord.by_year.count.select{|k,v| k.year == 2010}.first
        b = MusicRecord.count_by(:year).select{|k,v| k.year == 2010}.first
        expect(a).to eq b
      end
    end

  end


  it 'should raise error if :time_period is erroneous'

end