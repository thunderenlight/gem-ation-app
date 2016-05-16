class Invitation < ActiveRecord::Base

	belongs_to :invitee, class_name: "User", foreign_key: "user_id"
	belongs_to :attended_event, class_name: "Event", foreign_key: "event_id"
	belongs_to :invitor, through: :invitee

end
