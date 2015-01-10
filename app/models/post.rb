class Post < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "200x200>" }, :default_url => "default.jpg"
  		validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	else
  		has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "200x200>" }, :default_url => "default.jpg",
  			:storage => :dropbox,
  			:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  			:path => ":style/:id_:filename"
  		validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	end
	default_scope -> {order('created_at DESC')}
	belongs_to :user
	validates :title, presence: true, length: {maximum: 50}
	acts_as_votable

	self.per_page = 10

	def score
		self.get_upvotes.size - self.get_downvotes.size
	end
end
