class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.references :user, index: true

      t.timestamps
    end

    add_attachment :organizations, :avatar
  end
end
