class Employee
  attr_accessor :id
  attr_reader :username, :role
  def initialize(attr = {})
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
  end

  def self.headers
    ['id', 'username', 'password', 'role']
  end

  def password?(pw)
    pw == @password
  end

  def manager?
    @role == 'manager'
  end
end
