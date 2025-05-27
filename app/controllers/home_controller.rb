class HomeController < ApplicationController
   before_action :authenticate_user!

   def index
      puts current_user.email
      puts current_user.admin
      if current_user.admin?
         
         render 'adm'
      else
         render 'index'
      end
   end

end
