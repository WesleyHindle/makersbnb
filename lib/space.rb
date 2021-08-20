class Space


  def self.create(space_name:, space_description:, userID:, space_price:, available_from:, available_to:) #Check the order
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

##Check the ordering of the columns is correct

    connection.exec(

      "INSERT INTO spaces (space_name, space_description, space_price, available_from, available_to, userid) 
       VALUES ('#{space_name}', '#{space_description}', 
      '#{space_price}', '#{available_from}', '#{available_to}', '#{userID}');"
    )

  end
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec("SELECT * FROM spaces;")
  end
end