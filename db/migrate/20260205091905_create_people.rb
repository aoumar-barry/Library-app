class CreatePeople < ActiveRecord::Migration[7.2]
  def change
    create_table :people do |t|
      t.string :nom
      t.string :prenom
      t.string :email

      t.timestamps
    end
  end
end
