require 'httparty'
require 'json'

class Kele
   include HTTParty
   include JSON
   
   def initialize(email, password)
    @base_url = 'https://www.bloc.io/api/v1'

    response = Kele.post(
			"#{@base_url}/sessions",
      body: { email: email, password: password }
    )

    if response && response["auth_token"]
      @auth_token = response["auth_token"]
      puts "#{email} has sucessfully logged in"
    else
      puts "Login invalid"
    end
  end

  def get_me
    response = self.class.get('https://www.bloc.io/api/v1/users/me', headers: { "authorization" => @auth_token })
    @current_user = JSON.parse(response.body.to_s)
  end

  def get_mentor_availability(id)
    url = 'https://www.bloc.io/api/v1/mentors/' + id.to_s + '/student_availability'
    response = self.class.get( url, values: { "id" => id }, headers: { "authorization" => @auth_token })
    @mentor_availability = JSON.parse(response.body.to_s)
  end
end