class SessionsController < ApplicationController
  def new
    # renderöi kirjautumissivun
  end

  def create
    # haetaan usernamea vastaava käyttäjä tietokannasta
    user = User.find_by username: params[:username], password: params[:password]
    # talletetaan sessioon kirjautuneen käyttäjän id (jos käyttäjä on olemassa)
    if user
      session[:user_id] = user.id
      # uudelleen ohjataan käyttäjä omalle sivulleen
      redirect_to user
    else
      redirect_to signin_url, flash: {error: 'Username or password incorrect'}
    end
  end

  def destroy
    # nollataan sessio
    session[:user_id] = nil
    # uudelleenohjataan sovellus pääsivulle
    redirect_to :root
  end
end
