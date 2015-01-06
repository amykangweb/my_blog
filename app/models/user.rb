class User < ActiveRecord::Base
include Gravtastic
gravtastic
has_many :posts, dependent: :destroy
has_many :comments, dependent: :destroy
validates :name, presence: true
acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
