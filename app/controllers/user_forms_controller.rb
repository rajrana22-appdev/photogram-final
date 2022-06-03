class UserFormsController < ApplicationController
  def new_registration_form
    render({ :template => "user_forms/sign_up.html.erb" })
  end

  def new_session_form
    render({ :template => "user_forms/sign_in.html.erb" })
  end

  def create_cookie
    user = User.where({ :email => params.fetch("query_email") }).at(0)

    password = params.fetch("query_password")

    if user.nil?
      redirect_to("/user_sign_in", { :alert => "No user with that email address." })
    else
      valid = user.authenticate(password)

      if valid != false
        session.store(:user_id, user.id)

        redirect_to("/", { :notice => "Signed in successfully." })
      else
        redirect_to("/user_sign_in", { :alert => "Incorrect password." })
      end
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
end
