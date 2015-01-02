class Comment < ActiveRecord::Base
  default_scope -> {order('created_at DESC')}
  belongs_to :post
  validates :body, presence: true
end
