Employee = Struct.new(:id, :name, :reporters) do
  def manager?
    reporters.any?
  end
end

class Company
  # class with all the company structure
  #          CEO
  #         /  \
  #     Chief1  Chief2
  #     /   \
  # Manager1  Manager2
  #  /  \         \
  # Em1  Em2      Em3

  def initialize
    @employee_1 = Employee.new(6, 'Employee1', [])
    @employee_2 = Employee.new(7, 'Employee2', [])
    @employee_3 = Employee.new(8, 'Employee3', [])

    @manager_1 = Employee.new(4, 'Manager1', [employee_1, employee_2])
    @manager_2 = Employee.new(5, 'Manager2', [employee_3])

    @chief_1 = Employee.new(2, 'Chief1', [manager_1, manager_2])
    @chief_2 = Employee.new(3, 'Chief2', [])

    @ceo = Employee.new(1, 'CEO', [chief_1, chief_2])
  end

  attr_reader :employee_1, :employee_2, :employee_3, :manager_1, :manager_2, :chief_1, :chief_2, :ceo

  def structure
    ceo
  end
end
