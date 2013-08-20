# AggtiveRecord

**NOTE:** This gem is not really functional yet. I just like to commit things good and early.

An attempt to formalize the description of common aggregations across timestamped records.

I wrote this gem because I found myself writing, over and over again, these kind of ActiveRecord scope:


To get the number of messages sent in the last two weeks:

    Message.where('sent_at >= ?', 14.days.ago).count 

To get the *rate* of messages *per week*:

    Message.count * SECONDS_PER_WEEK / (Message.order('sent_at ASC').last - Message.order('sent_at ASC').first) 

Or how about the rate *per week* for messages sent in the *past month* (because it's interesting to know if someone has sent more messages recently)?

    Message.where('sent_at >= ?', 1.month.ago) * SECONDS_PER_WEEK / (Time.now - 1.month.ago)

This is easily enough to formalize in one application, but I figured maybe it'd be useful to have a convention for every app that I ever do that tries to aggregate records by time.

### Let's make some meta-magic

So for the first example, for counting messages in the past two weeks, something like:

    Message.count_past_14_days

OK, admittedly that's not much nicer than the standard ActiveRecord chain. But for the second example, it could be simplified to this:

    Message.rate_per_week

And for the third example:

    Message.rate_during_past_month_per_week



**AggtiveRecord** is an extension that can be applied to ActiveRecord. Maybe you'll find it useful, maybe not.


This gem takes some inspiration from the highly useful groupdate.


    Message.count_during_past_year_per_day


    Message.group_by_day.where('sent_at >= ?' 1.year.ago)






### Interaction with :has_many

*Obviously, this is just speculative*

    @person.rate_of_messages_per_day

    @person.messages_count_during_past_year_per_day

    @person.messages_rate_per_day_during_past_year

    @person.messages_count_in_past_year_by_day
    @person.messages_count_in_past_year_by_day

    Message.count_during_past_year


A standard verbose call:

    @person.sum_word_count_from_messages_during_past_year_by_day


*Under the hood query:*

    @person.egg.
      collate(:sum, :word_count).
      from(:messages).
      in(:past_year).
      by(:day)
*Which translates to this in ActiveRecord:*

    @person.messages.
      where('sent_at >= ?', 1.year.ago).
      group_by_day(:sent_at).
      sum(:word_count)
  

### Result types




### Scalars

    @messages.count_during_past_year
    @messages.rate_per_day_during_past_year
    @messages.average_per_day_of_word_count_during_past_year
    @messages.sum_of_word_count_during_past_year

### Arrays
*similar to groupdate*

    @messages.count_in_past_year_by_day
    @messages.count_in_past_year_by_weekday
    @messages.count_in_past_year_by_dayhour
    @messages.count_in_past_year_by_hour

    @messages.rate_per_hour_in_past_year_by_day
    @messages.average_per_day_of_word_count_during_past_year_by_month
    @messages.sum_of_word_count_during_past_year_by_day
    


### Custom time periods

    @messages.count_during_year(year: 2010)
    @messages.count_during_years(years: 2008..2012)
    @messages.count_during_day(day: '2012-12-01')
    @messages.count_during_year_by_week(year: 2010, timezone: 'PST', first_day: 'Sunday')




count

rate_per
average_per, of_numeric_value

sum, of_numeric_value

list_of_proper_nouns_during_past_year

counted_list_of_proper_nouns_during_past_year


