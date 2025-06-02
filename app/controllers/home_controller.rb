class HomeController < ApplicationController
   before_action :authenticate_user!

   def index
      if current_user.admin?

         @users = User.all

         render "adm"
      else
         render "index"
      end
   end


end
