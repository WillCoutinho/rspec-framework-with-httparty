# frozen_string_literal: true

# Hold base URI and some configs to make requests
module Employee
  include HTTParty
  base_uri 'https://dummy.restapiexample.com/api/v1'
  format :json # file type
  headers 'Content-Type': 'application/json'
end
