class CreateBillOrders < ActiveRecord::Migration
  def change
    create_table :bill_orders do |t|
      t.integer :folio
      t.date :issued
      t.string :status

      t.timestamps
    end
  end
end
