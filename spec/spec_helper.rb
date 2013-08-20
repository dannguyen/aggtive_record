$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'aggtive_record'
require 'active_record'
require 'mysql2'
require 'database_cleaner'


# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}



ActiveRecord::Base.establish_connection(
  :adapter => "mysql2",
  :database => "test_aggtive_record",
  username: 'root',
  password: ''

)

ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :music_records , force: true do |t|
    t.string     "title"
    t.string     "genre"
    t.datetime   'published_at'
    t.string      'description'
    t.timestamps
  end 
end

class MusicRecord < ActiveRecord::Base 
  include AggtiveRecord::Aggable
end







DatabaseCleaner.strategy = :truncation



RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation # :progress, :html, :textmate

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end



