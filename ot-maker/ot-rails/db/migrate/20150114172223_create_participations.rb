class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :user, index: true
      t.references :organization, index: true
      t.string :role
      t.integer :state

      t.timestamps
    end
  end
end
