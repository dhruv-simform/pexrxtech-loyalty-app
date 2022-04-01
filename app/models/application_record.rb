# frozen_string_literal: true

# Added protection from sql injection
class ApplicationRecord < ActiveRecord::Base
  # protect_from_forgery
  self.abstract_class = true
end
