class Person
  def initialize(firstname, lastname)
    @firstname = firstname
    @lastname = lastname
  end

  def greet
    puts "Hello, my name is #{@firstname} #{@lastname}!"
  end
end

p1 = Person.new("Charlotte", "Koch")
p2 = Person.new("Rukey", "Greentail")

p1.greet
p2.greet

Dir.entries("/").each_with_index { |d, i| puts("#{i}:\t#{d}") }
