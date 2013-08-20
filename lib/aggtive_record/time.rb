module AggtiveRecord
  module Time 

    UNIFORM_PERIODS = [:week, :day, :hour, :minute, :second]
    CALENDAR_PERIODS = [:year, :month]

    PERIODS = CALENDAR_PERIODS + UNIFORM_PERIODS 

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

  end
end