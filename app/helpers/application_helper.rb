module ApplicationHelper

  def render_navigation
    if session[:user_id]  
      link_to "Logout", '/logout', method: 'delete' + " " + (link_to "All The Spots", skatespots_path)
    else 
      link_to("Login", '/login') + " " + link_to("Sign Up", '/signup')
    end 
  end

end
