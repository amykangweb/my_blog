class Post < ActiveRecord::Base
	default_scope -> {order('created_at DESC')}
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :content, presence: true
end
