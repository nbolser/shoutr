class Dashboard
  def initialize(user)
    @user = user
  end

  def timeline
    Timeline.new(timeline_users).shouts
  end

  private

  attr_accessor :user

  def timeline_users
    user.followed_users + [user]
  end
end
