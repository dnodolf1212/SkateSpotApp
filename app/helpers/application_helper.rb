module ApplicationHelper

  def render_navigation
    if session[:user_id]  
      link_to "Logout", '/logout', method: 'delete' 
    else 
      link_to("Login", '/login') + " " + link_to("Sign Up", '/signup')
    end 
  end

  def render_comment_edit

    if session[:user_id] 
      link_to "Edit This Comment", edit_skatespot_comment_path(@skatespot)
    else
      link_to "Write a Comment for this Spot!", new_skatespot_comment_path(@skatespot)
    end
  end
  

end
