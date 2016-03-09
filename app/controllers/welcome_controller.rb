class WelcomeController < ApplicationController

  def index
  end

#_______________________________________________________________________________
#_______________________________________________________________________________

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
#_______________________________________________________________________________
#_______________________________________________________________________________

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
      #This saves the user with all the new information
      @user.save

#_______________________________________________________________________________
#_______________________________________________________________________________

      # This appends phone1 to the new user's phones
      if !phone1.empty?
        # This creates a new phone
        phone = Phone.new
        # With the phone object we want to set it's values below
        phone.number = phone1
        #This saves the new phone information
        phone.save
        @user.phones << phone
      end

      # This appends phone1 to the new user's phones
      if !phone2.empty?
        # This creates a new phone
        phone = Phone.new
        # With the phone object we want to set it's values below
        phone.number = phone2
        #This saves the new phone information
        phone.save
        @user.phones << phone
      end

      # This appends phone1 to the new user's phones
      if !phone3.empty?
        # This creates a new phone
        phone = Phone.new
        # With the phone object we want to set it's values below
        phone.number = phone3
        #This saves the new phone information
        phone.save
        @user.phones << phone
      end

      # This puts the new user and its values into an encrypted cookie
      session[:user_id] = @user.id.to_s
      redirect_to '/welcome/login'
    else
      render 'index'
    end
  end

#_______________________________________________________________________________
#_______________________________________________________________________________

  def login
    # We want to compare our user name and password with our database and if it works we will redirect to the information page
    users = User.where("user_name = ? AND password = ?", params[:user_name], params[:password])
    # If the users imput is empty then redirect to the current login page
    if users.empty?
      flash.now[:alert] = 'Not Valid'
      render '/welcome/login'
    # elsif if the user/password parameters equal the parameters from the current session then redirect to the information page
    else
      session[:user_id] = users.first.id
      redirect_to '/welcome/info'
    end
  end

#_______________________________________________________________________________
#_______________________________________________________________________________

def info
  @user = User.find(session[:user_id])
  render 'info.html.erb'
end

#_______________________________________________________________________________
#_______________________________________________________________________________

def logout
  session[:user_id] = nil
  flash[:notice] = 'You have successfully logged out.'
  redirect_to '/welcome/login'
  end
end
