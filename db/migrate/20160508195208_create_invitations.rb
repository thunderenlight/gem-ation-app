class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :invitee
      t.references :attended_event

      t.timestamps null: false
    end
  end
end
