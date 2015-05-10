class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.references :work_order, index: true
      t.string :detail
      t.string :status
      t.references :notification_type, index: true

      t.timestamps
    end
  end
end
