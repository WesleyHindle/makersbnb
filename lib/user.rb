class User

  def self.create(username:, first_name:, second_name:, password:, email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makerbnb')
    end
    connection.exec(
      "INSERT INTO users (username, first_name, second_name, password, email)
       VALUES ('#{username}', '#{first_name}', 
      '#{second_name}', '#{password}', '#{email}');"
    )
  end

  def self.username_available?(username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makerbnb')
    end
    result = connection.exec("SELECT * FROM users WHERE username = '#{username}';").to_a

    if result.length == 0
      true
    else
      false
    end    
  end
end