class User < ActiveRecord::Base
include Gravtastic
gravtastic
has_many :posts, dependent: :destroy
validates :name, presence: true
validates :blog, presence: true, length: {minimum: 5, maximum: 50}
validates :subheader, presence: true, length: {minimum: 5, maximum: 200}
acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
