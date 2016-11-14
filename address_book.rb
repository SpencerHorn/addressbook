require "./contact.rb"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end

address_book = AddressBook.new

spencer = Contact.new
spencer.first_name = "Spencer"
spencer.middle_name = "Larry"
spencer.last_name = "Horn"
spencer.add_phone_number("Home", "123-123-1234")
spencer.add_phone_number("Work", "123-123-4321")
spencer.add_address("Home", "2610 test dr", "", "Durham", "NC", "27701")

address_book.contacts.push(spencer)
address_book.print_contact_list
