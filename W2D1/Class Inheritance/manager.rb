require_relative 'employee.rb'

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees # array of all managed employees
  end

  def bonus(multiplier)
    salaries = employees.map { |emp| emp.salary }
    salaries.sum * multiplier
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil, [])
darren = Manager.new("Darren", "TA Manager", 78000, ned, [])
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("david", "TA", 10000, darren)

ned.employees = [darren, shawna, david]
darren.employees = [shawna, david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000