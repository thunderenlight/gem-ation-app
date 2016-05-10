class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :creator, class_name: "User"
  has_many :invitations
  has_many :invitees, through: :invitations
  geocoded_by :location
  after_validation :geocode
  validates :title, presence: true
  # after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }
end
