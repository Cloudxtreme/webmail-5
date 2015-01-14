class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles, :id => false do |t|
      t.uuid :id, :primary_key => true
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
