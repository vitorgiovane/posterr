class Api::V1::UsersController < Api::V1::ApiController
  before_action :set_followed_user, only: [:follow, :unfollow]

  def follow
    following = Following.create(following_params)
    return render json: following, status: 201 if following.persisted?

    render json: following.errors.messages, status: 400
  end

  def unfollow
    following = Following.where(following_params)
    return render json: { errors: ['The user is not followed'] }, status: 400 if following.blank?

    result = following.delete_all

    return render json: { message: 'The user has been unfollowed' }, status: 201 if boolean_cast(result)

    render json: { errors: [*following.errors.messages] }, status: 400
  end

  private

  def set_followed_user
    @followed_user = User.find(params[:id])
  end

  def following_params
    { follower_user: current_user, followed_user: @followed_user }
  end
end
