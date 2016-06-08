require_relative 'db_connect'
require_relative 'contact'



# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList < ActiveRecord::Base

  puts "<------------Contact List App--------------->"
  puts "New - Create a new contact"
  puts "List - List all the contacts"
  puts "Show - Show a contacts"
  puts "Search - Search all the contacts"
  puts "Update - Update an existing contact"
  puts "<------------------------------------------->"
end

  if ARGV[0] == "New"
      puts "Enter contact Name"
      name = STDIN.gets.chomp
      puts "Enter contact email address"
      email = STDIN.gets.chomp
      Contact.create(name: name, email: email).save
      puts "Contact Created!"

  elsif ARGV[0] == "List"
      Contact.all.each {|contact| puts "Contact ID: #{contact.id}, Name: #{contact.name}, Email: #{contact.email}"}

  elsif ARGV[0] == "Show"
      puts "Enter contact index value"
      value = STDIN.gets.chomp.to_i
      Contact.find(value).attributes.each do |attribute_name,attribute_value|
        puts " #{attribute_name}: #{attribute_value}"
      end
  elsif ARGV[0] == "Search"
      puts "Which contact do you want to find?"
      term = STDIN.gets.chomp
      Contact.where('name like ?', "%#{term}%").each{|contact| puts "Contact ID: #{contact.id}, Name: #{contact.name}, Email: #{contact.email}"}

  elsif ARGV[0] == "Update"
      puts "Please enter an ID number"
      id = STDIN.gets.chomp.to_i
      puts "Enter New Name "
      new_name = STDIN.gets.chomp
      puts "Enter New Email"
      new_email = STDIN.gets.chomp
      change =  Contact.find(id)
      change.update(name: new_name)
      change.update(email: new_email)
      change.save
      puts "Contact updated!"

  elsif ARGV[0] == "Delete"
      puts "Please enter an ID number "
      id = STDIN.gets.chomp.to_i
      Contact.delete(id)
      puts "Contact Deleted!"
  end
