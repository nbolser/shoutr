class Shout < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  delegate :username, to: :user
end
