class Patient < ActiveRecord::Base
  # Remember to create a migration!
  has_many :records
  has_many :doctors, through: :records

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(loginfo)
    name = loginfo[:name]
    password =loginfo[:password]

    doctor = Doctor.find_by_name(name)
    return doctor if doctor && doctor.password == password
    nil
  end
end
