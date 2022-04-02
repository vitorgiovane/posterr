class PostValidator < ActiveModel::Validator
  def validate(record)
    validate_amount_of_user_posts(record)
    validate_parent_existence(record)
  end

  private

  def validate_amount_of_user_posts(record)
    return unless record.user
    
    today_period = Date.today.beginning_of_day..Date.today.end_of_day

    today_posts = record.user.posts.where(created_at: today_period)
    accepted_posts_amount = 5
    return if today_posts.size < accepted_posts_amount

    record.errors.add :errors, "Exceeded the posts amount today"
  end

  def validate_parent_existence(record)
    return if record.parent.present?
    return unless record.parent_id
    return if Post.find_by_id record.parent_id

    failed_repost_message = "Unable to repost because it was not possible to find a post with the informed parent_id"
    record.errors.add :errors, failed_repost_message
  end
end