class Event < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  has_attached_file :image,
                    styles: { thumb: ["64x64#", :jpg],
                      original: ['500x500>', :jpg] },
                      convert_options: { thumb: "-quality 75 -strip", 
                        original: "-quality 85 -strip" }
  validates_attachment :image, content_type: { content_type: 
                    ["image/jpeg", "image/gif", "image/png"]}

  belongs_to :venue
  belongs_to :creator, class_name: "User"
  has_many :invitations
  # has_many :invitees, through: :invitations

  geocoded_by :location
  after_validation :geocode
  validates :title, presence: true
  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user  : nil }
  # after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }


    def invite(user)
      self.invitations.create(invitee: user)
    end

end
