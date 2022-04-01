class PostValidator < ActiveModel::Validator
  def validate(record)
    validate_amount_of_user_posts(record)
  end

  private

  def validate_amount_of_user_posts(record)
    return unless record.user
    
    today_period = Date.today.beginning_of_day..Date.today.end_of_day

    today_posts = record.user.posts.where(created_at: today_period)
    accepted_posts_amount = 5
    return if today_posts.size < accepted_posts_amount

    record.errors.add :general, "Exceeded the posts amount today"
  end
end