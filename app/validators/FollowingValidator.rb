class FollowingValidator < ActiveModel::Validator
  def validate(record)
    validate_same_follower_and_followed_user(record)
    validate_already_follow_user(record)
  end

  private

  def validate_same_follower_and_followed_user(record)
    return if record.follower_user.id != record.followed_user.id

    record.errors.add :errors, "The user cannot follow himself"
  end

  def validate_already_follow_user(record)
    following = Following.where(follower_user: record.follower_user, followed_user: record.followed_user)

    return if following.blank?

    record.errors.add :errors, "The user is already followed"
  end
end