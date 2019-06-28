class GetCommonManagerService
  def call(first, second, company_structure)
    first_management_path = get_management_path(first, company_structure, [])
    second_management_path = get_management_path(second, company_structure, [])

    find_common_manager(first_management_path, second_management_path)
  end

  private

  def get_management_path(employee, manager, path)
    return path if manager == employee
    return nil unless manager.manager?

    manager.reporters.map do |reporter|
      get_management_path(employee, reporter, path + [manager])
    end.compact.flatten
  end

  def find_common_manager(first_path, second_path)
    common_manager = nil

    [first_path.size, second_path.size].min.times do |n|
      break if first_path[n] != second_path[n]
      common_manager = first_path[n]
    end

    raise StandardError, 'No common managers found' unless common_manager
    puts "Common Manager: #{common_manager.name} ID #{common_manager.id}"
    return common_manager
  end
end
