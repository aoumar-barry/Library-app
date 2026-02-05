class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :titre
      t.string :auteur
      t.references :person, null: true, foreign_key: true

      t.timestamps
    end
  end
end
