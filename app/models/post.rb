class Post < ActiveRecord::Base
	default_scope -> {order('created_at DESC')}
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :content, presence: true
	acts_as_votable

	def score
		self.get_upvotes.size - self.get_downvotes.size
	end
end
