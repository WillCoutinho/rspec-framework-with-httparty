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
  @post_url = 'https://dummy.restapiexample.com/api/v1/create'
end

When('the employee information be sent') do
  @post_payload = {
    'id' => 999,
    'employee_name' => 'Tony',
    'employee_salary' => 420_800,
    'employee_age' => 30,
    'profile_image' => ''
  }

  @create_employee = HTTParty.post(@post_url, headers: { 'Content-Type': 'application/json' },
                                              body: @post_payload.to_json)
end

Then('this employee should be register') do
  expect(@create_employee.code).to eql 200
  expect(@create_employee['message']).to eql 'Successfully! Record has been added.'
  expect(@create_employee['status']).to eql 'success'
  expect(@create_employee['data']['employee_name']).to eql @payload['employee_name']
  expect(@create_employee['data']['employee_salary']).to eql @payload['employee_salary']
  expect(@create_employee['data']['employee_age']).to eql @payload['employee_age']
end

Given('that user changes an employee info') do
  # @get_employee = HTTParty.get('https://dummy.restapiexample.com/api/v1/employees',
  # headers: { 'Content-Type': 'application/json' })
  # This dummy rest-api example has request limit and returns 429 error.
  # So due that I just get some random ID from 1 to 23 (len limit) from v1/employees

  @put_url = "https://dummy.restapiexample.com/api/v1/update/#{Random.new.rand(1...23)}"
  puts @put_url
end

When('this changes be sent') do
  @put_payload = {
    'employee_name' => 'Alberto',
    'employee_salary' => 100,
    'employee_age' => 40,
    'profile_image' => ''
  }

  @update_employee = HTTParty.put(@put_url, headers: { 'Content-Type': 'application/json' }, body: @put_payload.to_json)
end

Then('this employee info will be changed') do
  expect(@update_employee.code).to eql 200
  expect(@update_employee.msg).to eql 'OK'
  expect(@update_employee['status']).to eql 'success'
  expect(@update_employee['message']).to eql 'Successfully! Record has been updated.'
  expect(@update_employee['data']['employee_name']).to eql @put_payload['employee_name']
  expect(@update_employee['data']['employee_salary']).to eql @put_payload['employee_salary']
  expect(@update_employee['data']['employee_age']).to eql @put_payload['employee_age']
end
