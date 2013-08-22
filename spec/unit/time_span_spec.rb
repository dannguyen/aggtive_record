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

        it 'should span a #month' do 
          @record = MusicRecord.create published_at: 4.months.ago
          MusicRecord.create published_at: 2.days.ago
          expect(MusicRecord.past_month.count).to eq 1
        end

        it 'should span an #hour' do 
          @record = MusicRecord.create published_at: 2.hours.ago
          MusicRecord.create published_at: 1.minute.ago
          expect(MusicRecord.past_hour.count).to eq 1
        end
      end

      context 'plural periods' do 
        it 'has a few of these: 14 days, 30 days, 6 months, etc' do 
          [2.years.ago, 4.months.ago, 15.days.ago, 1.minute.ago].each do |t| 
            MusicRecord.create published_at: t
          end

          expect(MusicRecord.past_6_months.count).to eq 3
          expect(MusicRecord.past_30_days.count).to eq 2
          expect(MusicRecord.past_14_days.count).to eq 1
        end
      end    
    end


    describe 'just period name' do 
      context 'single argument' do 
        it 'spans #year(1999)'
      end
    end

  end
end