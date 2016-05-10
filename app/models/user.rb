class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :zxcvbnable


  has_many :created_events, class_name: "Event", foreign_key: :creator_id
  has_many :invitations


  class << self
	  def from_omniauth(auth_hash)
	    user = find_or_initialize_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	    user.name = auth_hash['info']['name']
	    user.location = auth_hash['info']['location']
	    user.image_url = auth_hash['info']['image']
	  	user.url = auth_hash['info']['urls'][user.provider.capitalize]
	    user.save!
	    user
	  end
	end
end
