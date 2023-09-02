# frozen_string_literal: true

Given('that user wants check all employees information') do
  @get_url = 'https://dummy.restapiexample.com/api/v1/employees'
end

When('start this search') do
  @list_employee = HTTParty.get(@get_url)
end

Then('a employees list should be returned') do
  expect(@list_employee.code).to eql 200
  expect(@list_employee.message).to eql 'OK'
end

Given('that user wants to register a new employee') do
  @get_url = 'https://dummy.restapiexample.com/api/v1/create'
end

When('the employee information be sent') do
  @payload = {
    'id' => 999,
    'employee_name' => 'Tony',
    'employee_salary' => 420_800,
    'employee_age' => 30,
    'profile_image' => ''
  }

  @create_employee = HTTParty.post(@get_url, headers: { 'Content-Type': 'application/json' }, body: @payload.to_json)
end

Then('this employee should be register') do
  expect(@create_employee.code).to eql 200
  expect(@create_employee['message']).to eql 'Successfully! Record has been added.'
  expect(@create_employee['status']).to eql 'success'
  expect(@create_employee['data']['employee_name']).to eql @payload['employee_name']
  expect(@create_employee['data']['employee_salary']).to eql @payload['employee_salary']
  expect(@create_employee['data']['employee_age']).to eql @payload['employee_age']
end
