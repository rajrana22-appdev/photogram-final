class UserFormsController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:new_session_form, :create_cookie] })

  def new_session_form
    render({ :template => "user_forms/sign_in.html.erb" })
  end

  def create_cookie
    user = User.where({ :email => params.fetch("query_email") }).at(0)

    password = params.fetch("query_password")

    if user != nil
      legit = user.authenticate(password)

      if legit == false
        redirect_to("/user_sign_in", { :alert => "Incorrect password." })
      else
        session.store(:user_id, user.id)

        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/user_sign_in", { :alert => "No user with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
end
