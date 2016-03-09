class WelcomeController < ApplicationController

  def index
  end

________________________________________________________________________________
________________________________________________________________________________

  def register
    if params.has_key?(:user_name) && !params[:user_name].strip.empty?
      # The following lines take the parameters from the form and assigns them to the appropriate variable
      user_name = params[:user_name].strip
      password = params[:password].strip
      address = params[:address].strip
      full_name = params[:full_name].strip
      city = params[:city].strip
      state = params[:state].strip
      zip_code = params[:zip_code].strip
      country = params[:country].strip
      email = params[:email].strip
      # This stores the data for 3 phones and puts it in our phones database
      phone1 = params[:phone1].strip
      phone2 = params[:phone2].strip
      phone3 = params[:phone3].strip
________________________________________________________________________________
________________________________________________________________________________

      # This creates a new user
      @user = User.new
      # With the user object we want to set it's values below
      @user.user_name = user_name
      @user.password = password
      @user.address = address
      @user.full_name = full_name
      @user.city = city
      @user.state = state
      @user.zip_code = zip_code
      @user.country = country
      @user.email = email

________________________________________________________________________________
________________________________________________________________________________

      # This creates a new phone
      phone = Phone.new
      # With the phone object we want to set it's values below
      phone.number = phone1
      phone.number2 = phone2
      phone.number3 = phone3
      # This appends phone to the new user's phones
      @user.phones << phone

      #This saves the new phone information
      phone.save

      #This saves the user with all the new information
      @user.save

      # This puts the new user and its values into an encrypted cookie
      session[:user_id] = @user.id.to_s
      redirect_to '/welcome/login'
    else
      render 'index'
    end
  end

________________________________________________________________________________
________________________________________________________________________________

  def login
    # We want to compare our user name and password with our database and if it works we will redirect to the information page
    users = User.where("user_name = ? AND password = ?", params[:user_name], params[:password])
    # If the users imput is empty then redirect to the current login page
    if users.empty?
      render '/welcome/login'
    # elsif if the user/password parameters equal the parameters from the current session then redirect to the information page
    elsif users.first.user_name == params[:user_name] && users.first.password == params[:password]
      session[:user_name] = params[:user_name]
      session[:password] = params[:password]
      session[:id] = users.first.id
      redirect_to '/welcome/info'
    # Otherwise render the current page and display the information is 'Not Valid'
    else
      render '/welcome/login'
      flash.now[:alert] = 'Not Valid'
    end
  end

________________________________________________________________________________
________________________________________________________________________________

  def info
  end
end
