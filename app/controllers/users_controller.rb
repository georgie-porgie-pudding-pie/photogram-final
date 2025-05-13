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

  def discover
    the_id = params.fetch("username")

    matching_users = User.where({ :username => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/discover" })
  end

  def feed
    the_id = params.fetch("username")

    matching_users = User.where({ :username => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/feed" })
  end

  def liked_photos
    the_id = params.fetch("username")

    matching_users = User.where({ :username => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/liked_photos" })
  end

  def photos
    Photo.where({ :owner_id => @the_user.id })
  end

  def follow_requests_sent
    FollowRequest.where({ :sender_id => @the_user.id})
  end
  
  def follow_requests_receieved
    FollowRequest.where({ :recipient_id => @the_user.id})
  end

  def accepted_received_follow_requests
    FollowRequest.where({ :recipient_id => @the_user.id}).where({ :status => "accepted"})
  end
  
  def accepted_sent_follow_requests
    FollowRequest.where({ :sender_id => @the_user.id}).where({ :status => "accepted"})
  end

end
