require 'spec_helper'

describe "AggtiveRecord::EggScopes -- .rate" do


    describe '#rate_per' do 
      context 'singular periods' do 
        it 'should get about 1 a year' do 
          @record = MusicRecord.create published_at: 12.months.ago
          expect(MusicRecord.scoped.rate_per(:year) ).to be_within(0.1).of 1
        end
      

        context 'meta methods' do 
          it 'should have #rate_per_month' do 
            MusicRecord.create published_at: (1.month.ago - 1.second)
            MusicRecord.create published_at: 12.days.ago
            expect(MusicRecord.rate_per_month ).to be_within(0.01).of 2
          end

          it 'should have #rate_per_hour' do 
            MusicRecord.create published_at: (59.minutes.ago)
            MusicRecord.create published_at: 59.minutes.ago
            expect(MusicRecord.rate_per_hour ).to be_within(0.1).of 2
          end
        end


        context 'when time span of all records is less than the time period' do 
          context 'it should have a minimum rate of per that time_period' do 
            it 'should have rate no less than 1 per month' do 
              Timecop.freeze
              MusicRecord.create published_at: 1.day.ago 

              expect(MusicRecord.rate_per_month).to eq 1
            end
          end
        end

        it 'should raise an error when a non-time period is passed in'

      end

    end
  
    describe '#timespan_of' do 
      before(:each) do 
        @latest = 1.months.ago 
        @earliest = 14.months.ago 

        MusicRecord.create published_at: @latest
        MusicRecord.create published_at: 2.months.ago
        MusicRecord.create published_at: @earliest

        @collection = MusicRecord.all
      end

      it 'should return a range' do
        expect(MusicRecord.timespan_of(@collection)).to be_within(0.1).of @latest - @earliest
      end

      it 'should get #latest record in a set without re-querying database'
    end
end


# This is not usable
#
# context 'has two optional parameters' do 

#         before(:each) do 
#           MusicRecord.create(published_at: 1.day.ago )
#         end

#         let(:records){ MusicRecord.scoped }
        
#         context 'first parameter is the :start_time' do 
#           it 'bounds range with :start_time and Time.now' do 
#             pending 'rethink'
#             expect(records.rate_per(:day, 2.days.ago)).to be_within(0.1).of 0.5
#           end
#         end

#         context 'second parameter is the end_time' do 
#           it 'bounds range with :start_time and :end_time' do 
#             pending 'rethink'
#             expect(records.rate_per(:day, 2.days.ago)).to be_within(0.1).of 0.5
#           end

#           it 'has no effect on :where' do 
#             pending('This is troublesome. What if a user calls:
#              records.past_year.rate_per(:day, 10.days.ago, 3.days.ago) 
#               -- too many surprises here!
#              ')
#           end
#         end