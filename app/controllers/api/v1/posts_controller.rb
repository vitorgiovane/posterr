class Api::V1::PostsController < Api::V1::ApiController
  def index
    posts = Post.paginate(page: page, per_page: per_page).order('id DESC')

    render json: posts
  end

  def create
    post = Post.create(create_params)
    return render json: post, status: 201 if post.persisted?

    render json: post.errors.messages, status: 400
  end

  private

  def create_params
    original_params = params.permit(:content, :parent_id)
    { **original_params, user: current_user }
  end
end
