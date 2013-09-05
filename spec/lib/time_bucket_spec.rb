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
        published_at: "2012-05-12 15:00"
      )
    end

    context 'basic groupdate usage' do
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

      it 'groups #by_hour' do 
        @group = MusicRecord.by_hour.
                                count.
                                select{|k,v| k.hour == 15}.first
        expect(@group[1]).to eq 1 
      end


      context 'groupdate options' do 
        describe '#continuous' do 
          it 'should adopt the usage of groupdate series' do 
            pending %q{May make more sense to apply this operation at the end, as something separate from
groupdate as it's not related to ActiveRecord
            }
          end

          it 'populates default range between two endpoints'
          it 'populates a specified range'

        end
      end
    end



  end
end
