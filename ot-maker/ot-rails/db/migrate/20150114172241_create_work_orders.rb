class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.string :code
      t.string :title
      t.string :description
      t.references :user, index: true
      t.integer :user_assigned_id, index: true
      t.references :organization, index: true
      t.integer :organization_assigned_id, index: true
      t.references :bill_order, index: true
      t.integer :state

      t.timestamps
    end
  end
end