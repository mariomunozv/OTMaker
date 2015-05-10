class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :work_order, index: true
      t.references :user, index: true
      t.string :content

      t.timestamps
    end
  end
end
