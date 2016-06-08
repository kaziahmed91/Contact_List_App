require 'pry'
require 'active_record'
require_relative 'contact'

  # logger
ActiveRecord::Base.logger = Logger.new(File.open('contact_list.log', 'w'))

  #Establish Connection
puts "Establishing database connection..."
ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    database: "contacts",
    username: 'development',
    password: 'development',
    host: 'localhost',
    port: '5432',
    pool: 5,
    encoding: 'unicode',
    min_messages: 'error'
  )
puts "Connection Established."

puts "Setting up Database..Recreating Tables"

#   #Create Tables
# ActiveRecord::Schema.define do
#   # drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
#   create_table :contacts, force: true do |t|
#     t.column :name, :string
#     t.column :email,:string
#     t.timestamps null: false
#   end
# end

puts 'Setup DONE'
