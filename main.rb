require_relative 'company'
require_relative 'get_common_manager_service'

company = Company.new

GetCommonManagerService.new.call(company.chief_1, company.chief_2, company.structure)
GetCommonManagerService.new.call(company.chief_1, company.manager_2, company.structure)
GetCommonManagerService.new.call(company.employee_1, company.employee_2, company.structure)
GetCommonManagerService.new.call(company.employee_1, company.employee_3, company.structure)
