# frozen_string_literal: true

# DRY for assertions
class Assertions
  include RSpec::Matchers

  def request_success(status_code, message)
    expect(status_code).to eql 200
    expect(message).to eql 'OK'
  end
end
