# frozen_string_literal: true

# Structure for employee requests
class EmployeeRequests
  def find_employee
    Employee.get('/employees')
  end

  def create_employee(name, salary, age)
    Employee.post('/create', body: {
      employee_name: name,
      employee_salary: salary,
      employee_age: age,
      profile_image: ''
    }.to_json)
  end

  def update_employee(id:, name:, salary:, age:)
    Employee.put("/update/#{id}", body: {
      employee_name: name,
      employee_salary: salary,
      employee_age: age,
      profile_image: ''
    }.to_json)
  end

  def delete_employee(id:)
    Employee.delete("/delete/#{id}")
  end
end
