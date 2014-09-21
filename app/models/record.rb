class Record < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :patient
  belongs_to :doctor
  
end
