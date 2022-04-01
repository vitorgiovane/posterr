class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :parent

  def parent
    return nil unless object.parent
    PostSerializer.new object.parent
  end
end
