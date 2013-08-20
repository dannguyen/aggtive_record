require 'spec_helper'

require 'hashie'
=begin

IGNORE ALL OF THIS

class AnObject < ActiveRecord::Base
  include AggtiveRecord
  attr_accessor :star_count, :time_posted
  attr_timestamp :time_posted 
end

describe 'possible methods', skip: true do 

  context 'singular scopes' do 

    it '#past_14_days'
    it '#past_year'
    it '#past_20_years'
    it 'should not have #past_years'

    it 'by_year'
    it 'by_minute'
    it 'not by_microsecond'
  end

end

describe 'AnObject with AggtiveRecord mixedin', skip: true do 

  context 'class setup' do 
    it 'should have @@timestamp_attribute set to :time_posted' 
  end

  context 'scopes' do

    describe '#during' do 

      describe '.past_[time frame]' do  
        it 'should scope within past_14_days'
        it 'should scope within past_year'
      end

      describe '.[epoch_name]' do 
        it 'should scope #overall'
        it 'should scope year(1995)' do 
          pending %q{
            er...what's the <s></s>yntax for that...?


          }
        end
      end

    context 'AnObject scoped collection' do 
      describe '[agg]_of methods' do 
        it 'should have #count_of '
      end
    end
  end

end
=end