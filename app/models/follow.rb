class Follow < ActiveRecord::Base
  #self.table_name = :follows
  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  # NOTE: Follows belong to the "followable" interface, and also to followers
  belongs_to :followable, :polymorphic => true
  belongs_to :follower,   :polymorphic => true
  # belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  # belongs_to :current_user, class_name: 'User', foreign_key: 'current_user_id'

  def block!
    self.update_attribute(:blocked, true)
  end
  

end
