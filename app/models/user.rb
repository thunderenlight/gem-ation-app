class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :zxcvbnable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  has_attached_file :image,
                    styles: { thumb: ["64x64#", :jpg],
                      convert_options: { thumb: "-quality 75 -strip", 
                        original: "-quality 85 -strip" }
  validates_attachment :image, content_type: { content_type: 
                    ["image/jpeg", "image/gif", "image/png"]}

  has_many :created_events, class_name: "Event", foreign_key: :creator_id
  has_many :invitations
  has_many :accepted_invitations, through: :invitations, source: :attended_event_id



  class << self
	  def from_omniauth(auth_hash)
	    user = find_or_initialize_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	    user.name = auth_hash['info']['name']
	    user.location = auth_hash['info']['location']
	    user.image_url = auth_hash['info']['image']
	  	user.url = auth_hash['info']['urls'][user.provider.capitalize]
	  	user.oauth_token = auth_hash['credentials']['token']
	  	# user.email = auth_hash['info']['email'] ? user.email : "#{TEMP_EMAIL_PREFIX}-#{auth_hash['uid']}1-#{auth_hash['provider']}.com"
	  	# user.password = Devise.friendly_token[0,20]
	  	# user.skip_confirmation!
	   #  user.save!
	    user
	  end

	  def new_with_session(params, session)
	  	if session["devise.user_attributes"]
	  		new(session["devise.user_attributes"], without_protection: true) do |user|
	  			user.attributes = params
	  			user.valid?
	  		end
	  	else
	  		super
		end
	 end
 end


  def invited?(event)
  	self.invitations.where(event_id: event.id)
  end

  def password_required?
	super && provider.blank?	
 end

 def facebook
 	@facebook ||= Koala::Facebook::API.new(oauth_token)
 end


  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

end
