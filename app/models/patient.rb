class Patient < ActiveRecord::Base
  # Remember to create a migration!
  has_many :records
  has_many :doctors, through: :records
end
