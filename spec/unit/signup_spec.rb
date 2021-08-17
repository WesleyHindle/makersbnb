require_relative '../../lib/user.rb'

describe "users" do
  describe "create method" do
    it "User can create an account and it stores in the database" do
      connection = PG.connect(dbname: 'makersbnb_test')

      User.create(username: "Nazir123", first_name: "Nazir", second_name: "Shaikh", password: "jellySNAKES456", email: "Nazir@gogoanime.com")

      result = connection.exec("SELECT * FROM users;").to_a

      expect(result[0]['username']).to eq('Nazir123')
      expect(result[0]['first_name']).to eq('Nazir')
      expect(result[0]['second_name']).to eq('Shaikh')
      expect(result[0]['password']).to eq('jellySNAKES456')
      expect(result[0]['email']).to eq('Nazir@gogoanime.com')
    end
  end
end