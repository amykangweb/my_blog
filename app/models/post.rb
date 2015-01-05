class Post < ActiveRecord::Base
	default_scope -> {order('created_at DESC')}
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :content, presence: true
end
