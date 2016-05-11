class Event < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  belongs_to :venue
  belongs_to :creator, class_name: "User"
  has_many :invitations
  has_many :invitees, through: :invitations
  geocoded_by :location
  after_validation :geocode
  validates :title, presence: true
  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user  : nil }
  # after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }
end
