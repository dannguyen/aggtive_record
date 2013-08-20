module AggtiveRecord
  module Time 

    # A week is always 7 * 24 * 60 * 60, for instance
    UNIFORM_PERIODS = [:week, :day, :hour, :minute, :second]

    # e.g. A year may have 365 days or 366
    NON_UNIFORM_PERIODS = [:year, :month]

    PERIODS = NON_UNIFORM_PERIODS + UNIFORM_PERIODS 

    OTHER_PERIODS = [:day_of_week, :hour_of_day]

    # todo: better naming convention


    def self.periods
      PERIODS + OTHER_PERIODS
    end

=begin
    TIMESTAMP_QUANTITIES = [
      year: {
        str: '%Y' 
      },
      month:{
        str: '%m'
      },
      day: {
        str: '%d'
      }
      
      hour: {
        str: '%H'
      },

      minute: {
        str: '%i'
      },

      second: {
        str: '%S'
      }
    ]
=end


  end
end