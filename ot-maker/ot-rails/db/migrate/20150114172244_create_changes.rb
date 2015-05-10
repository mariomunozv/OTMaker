class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.references :work_order, index: true
      t.references :user, index: true
      t.integer :user_assigned_id, index:true
      t.string :code
      t.string :title
      t.string :description
      t.references :bill_order, index: true
      t.integer :state

      t.timestamps
    end
  end
end
