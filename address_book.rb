require "./contact.rb"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_results(search, results)
    puts search
    puts "-" * 50
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    print_results("Name search results (#{search})", results)

  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-", "").include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone number search results (#{search})", results)
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Address search results (#{search})", results)
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
spencer.first_name = "Bobby"
spencer.middle_name = "Larry"
spencer.last_name = "Monuts"
spencer.add_phone_number("Home", "123-123-1234")
spencer.add_phone_number("Work", "123-123-4321")
spencer.add_address("Home", "2610 test dr", "", "Durham", "NC", "27701")

andrea = Contact.new
andrea.first_name = "Jenny"
andrea.middle_name = "Louise"
andrea.last_name = "Jenkins"
andrea.add_phone_number("Home", "222-333-4444")
andrea.add_phone_number("Work", "555-666-7777")
andrea.add_address("Home", "2610 test dr", "", "Durham", "NC", "27701")

address_book.contacts.push(spencer)
address_book.contacts.push(andrea)

address_book.find_by_name('o')
address_book.find_by_phone_number("555")
address_book.find_by_address("2610")
