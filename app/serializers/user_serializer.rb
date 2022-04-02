class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :username,
             :date_joined_posterr,
             :number_of_followers,
             :number_of_followings,
             :number_of_posts_created,
             :followed_by_the_current_user

  def date_joined_posterr
    object.created_at.strftime('%b %d, %Y')
  end

  def number_of_followers
    object.followers.size
  end

  def number_of_followings
    object.followings.size
  end

  def number_of_posts_created
    object.posts.size
  end
end
