Rails.application.routes.draw do

  #------------------------------

  # Routes for the User resource:

  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })

  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_forms", :action => "new_registration_form" })

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_forms", :action => "new_session_form" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "users_form", :action => "destroy_cookies" })

  # STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_forms", :action => "create_cookie" })

  get("/", { :controller => "users", :action => "index" })

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/users/:path_username/own_photos", { :controller => "users", :action => "own_photos" })

  get("/users/:path_username/liked_photos", { :controller => "users", :action => "liked_photos" })

  get("/users/:path_username/feed", { :controller => "users", :action => "feed" })

  get("/users/:path_username/discover", { :controller => "users", :action => "discover" })

  #------------------------------

  # Routes for the Follow request resource:

  # CREATE
  post("/insert_follow_request", { :controller => "follow_requests", :action => "create" })

  # UPDATE
  post("/modify_follow_request/:path_id", { :controller => "follow_requests", :action => "update" })

  # DELETE
  get("/delete_follow_request/:path_id", { :controller => "follow_requests", :action => "destroy" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })

  # READ
  get("/likes", { :controller => "likes", :action => "index" })

  get("/likes/:path_id", { :controller => "likes", :action => "show" })

  # UPDATE

  post("/modify_like/:path_id", { :controller => "likes", :action => "update" })

  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })

  get("/comments/:path_id", { :controller => "comments", :action => "show" })

  # UPDATE

  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })

  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })

  # READ
  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  # UPDATE

  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })

  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  #------------------------------
end
