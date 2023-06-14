class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.integer :event_id
      t.integer :attendee_id
      t.boolean :attending

      t.timestamps
    end
  end
end
