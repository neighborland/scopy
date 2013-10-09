require 'coveralls'
Coveralls.wear!

require 'test/unit'
require 'shoulda-context'
require 'mocha/setup'
require 'active_support'
require 'active_record'
require 'sqlite3'
require 'scopy'

ActiveRecord::Base.logger = Logger.new(STDERR) if ENV["VERBOSE"]
 
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)

unless ActiveRecord::Base.connection.tables.include? 'dogs'
  ActiveRecord::Schema.define do  
    create_table :dogs do |table|
      table.column :created_at, :datetime
      table.column :name, :string
    end
  end
end
 
