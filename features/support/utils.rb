# frozen_string_literal: true

# Utils funcs
module Utils
  def self.get_random_value(start_number:, end_number:)
    Random.new.rand(start_number...end_number)
  end
end
