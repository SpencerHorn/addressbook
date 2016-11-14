require "./contact.rb"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    puts "Name search results (#{search})"
    puts "-" * 50
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
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

andrea = Contact.new
andrea.first_name = "Andrea"
andrea.middle_name = "Louise-Myrick"
andrea.last_name = "Horn"
andrea.add_phone_number("Home", "123-123-1234")
andrea.add_phone_number("Work", "123-123-4321")
andrea.add_address("Home", "2610 test dr", "", "Durham", "NC", "27701")

address_book.contacts.push(spencer)
address_book.contacts.push(andrea)

address_book.find_by_name('o')
