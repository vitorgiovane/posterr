class Api::V1::UsersController < Api::V1::ApiController
  before_action :set_user, only: [:show, :posts, :follow, :unfollow]

  def show
    @user.define_relationship_with_current_user(current_user)
    render json: @user
  end

  def posts
    render json: @user.posts.paginate(page: page, per_page: 5).order('created_at DESC')
  end

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

  def set_user
    @user = User.find(params[:id])
  end

  def following_params
    { follower_user: current_user, followed_user: @user }
  end
end
