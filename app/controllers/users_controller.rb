class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "users/index" })
  end

  def show
    the_id = params.fetch("username")

    matching_users = User.where({ :username => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/show" })
  end

  def photos
    Photo.where({ :owner_id => @the_user.id })
  end
end
