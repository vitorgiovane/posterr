class Api::V1::PostsController < Api::V1::ApiController
  def index
    posts = Post.paginate(page: page, per_page: per_page).order('id DESC')

    render json: posts
  end
  
  def show
    render json: { message: 'show' }
  end
end
