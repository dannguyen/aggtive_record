require 'spec_helper'


describe AggtiveRecord do 

  context 'collation with zero' do 

    describe '.rate_by' do 
      it 'should return rates of 0 with no records' do 

        expect(MusicRecord.rate_per_week(:past_month)).to eq 0
        expect(MusicRecord.rate_per_hour(:past_year)).to eq 0
        expect(MusicRecord.rate_per_hour(:overall)).to eq 0
      end
    end

    describe '.past_' do 
      it 'should be empty with no records' do 
        expect(MusicRecord.past_year).to be_empty
      end
    end

    describe '.count_by' do 
      it 'should be empty with no records' do 
        expect(MusicRecord.count_by_month).to be_empty
        expect(MusicRecord.past_year.count_by_month).to be_empty
      end
    end
  end

  context 'collation methods acting in concert' do
    before(:each) do 
      Timecop.freeze(Time.parse '2013-10-02')
      MusicRecord.create(published_at: 5.days.ago)
      MusicRecord.create(published_at: 1.month.ago)
      MusicRecord.create(published_at: 9.months.ago)
      MusicRecord.create(published_at: 14.months.ago)
    end


    it '#past_14_days' do 
      expect(MusicRecord.past_14_days.count).to eq 1
    end

    it '#overall' do 
      expect(MusicRecord.overall.count).to eq 4
    end



    it '#rate_per_week(:overall)'  do
      old_time = MusicRecord.order('published_at').pluck(:published_at).first
      new_time = Time.now

      expect(MusicRecord.rate_per_week(:overall)).to eq  MusicRecord.count.to_f * AggtiveRecord::Time.to_seconds(:week) /  (new_time - old_time)
    end

    it '#rate_per_month(:overall)'  do
      old_time = MusicRecord.order('published_at').pluck(:published_at).first
      new_time = Time.now
      
      expect(MusicRecord.rate_per_month(:overall)).to eq  MusicRecord.count.to_f * AggtiveRecord::Time.to_seconds(:month) /  (new_time - old_time)
    end



    it '#rate_per_week(:past_14_days)' do 
      expect(MusicRecord.rate_per_week(:past_14_days)).to eq 0.5
    end


    it '#past_year' do 
      expect(MusicRecord.past_year.count).to eq 3
    end


    it '#past_year.count_by_year' do 
      expect(MusicRecord.past_year.count_by_year).to eq( {Time.new(Time.now.year) => 3})
    end


    it '#past_year.count_by_week' do 
       expect(MusicRecord.past_year.count_by_week).to eq( 
        { Time.parse( "2012-12-30 00:00:00 -0500") =>1, 
          Time.parse( "2013-09-01 00:00:00 -0400") =>1, 
          Time.parse( "2013-09-22 00:00:00 -0400") =>1
        }
      )
    end

  end 
end