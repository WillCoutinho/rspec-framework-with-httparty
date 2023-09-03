# frozen_string_literal: true

Given('that user wants check all employees information') do
  @get_list = EmployeeRequests.new
  @assert = Assertions.new
end

When('start this search') do
  @list_employee_response = @get_list.find_employee
end

Then('a employees list should be returned') do
  @assert.request_success(@list_employee_response.code, @list_employee_response.message)
end

Given('that user wants to register a new employee') do
  @post_request = EmployeeRequests.new
  @assert = Assertions.new
  @create_employee_payload = {
    'employee_name' => Faker::Name.name,
    'employee_salary' => Faker::Number.number(digits: 5),
    'employee_age' => Faker::Number.number(digits: 2)
  }
end

When('the employee information be sent') do
  @create_employee_response = @post_request.create_employee(@create_employee_payload['employee_name'],
                                                            @create_employee_payload['employee_salary'],
                                                            @create_employee_payload['employee_age'])
end

Then('this employee should be register') do
  @assert.request_success(@create_employee_response.code, @create_employee_response.message)
  expect(@create_employee_response['message']).to eql 'Successfully! Record has been added.'
  expect(@create_employee_response['status']).to eql 'success'
  expect(@create_employee_response['data']['employee_name']).to eql @create_employee_payload['employee_name']
  expect(@create_employee_response['data']['employee_salary']).to eql @create_employee_payload['employee_salary']
  expect(@create_employee_response['data']['employee_age']).to eql @create_employee_payload['employee_age']
end

Given('that user changes an employee info') do
  # @get_employee = HTTParty.get('https://dummy.restapiexample.com/api/v1/employees',
  # headers: { 'Content-Type': 'application/json' })
  # This dummy rest-api example has request limit and returns 429 error.
  # So due that I made a WorkAround just getting some random ID from 1 to 23 (length employees) from v1/employees

  @put_request = EmployeeRequests.new
  @assert = Assertions.new
end

When('this changes be sent') do
  @update_employee_payload = {
    'employee_name' => 'Alberto',
    'employee_salary' => 100,
    'employee_age' => 40,
    'profile_image' => ''
  }

  @update_employee_response = @put_request.update_employee(id: Utils.get_random_value(start_number: 1, end_number: 23),
                                                           name: @update_employee_payload['employee_name'],
                                                           salary: @update_employee_payload['employee_salary'],
                                                           age: @update_employee_payload['employee_age'])
end

Then('this employee info will be changed') do
  @assert.request_success(@update_employee_response.code, @update_employee_response.message)
  expect(@update_employee_response['status']).to eql 'success'
  expect(@update_employee_response['message']).to eql 'Successfully! Record has been updated.'
  expect(@update_employee_response['data']['employee_name']).to eql @update_employee_payload['employee_name']
  expect(@update_employee_response['data']['employee_salary']).to eql @update_employee_payload['employee_salary']
  expect(@update_employee_response['data']['employee_age']).to eql @update_employee_payload['employee_age']
end

Given('that user wants to delete an employee') do
  # @get_employee = HTTParty.get('https://dummy.restapiexample.com/api/v1/employees',
  # headers: { 'Content-Type': 'application/json' })
  # The "dummy-rest-api-example" has request limit and returns 429 error.
  # So due that I made a WorkAround just getting some random ID from 1 to 23 (length employees) from v1/employees

  @delete_request = EmployeeRequests.new
  @assert = Assertions.new
end

When('this delete request is sent') do
  @id_to_delete = Utils.get_random_value(start_number: 1, end_number: 23)
  @delete_employee_response = @delete_request.delete_employee(id: @id_to_delete)
end

Then('this employee should be deleted') do
  @assert.request_success(@delete_employee_response.code, @delete_employee_response.message)
  expect(@delete_employee_response['status']).to eql 'success'
  expect(@delete_employee_response['message']).to eql 'Successfully! Record has been deleted'
  expect(@delete_employee_response['data']).to eql @id_to_delete.to_s
end
