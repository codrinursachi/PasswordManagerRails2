class CreatePasswords < ActiveRecord::Migration[8.0]
  def change
    create_table :passwords do |t|
      t.string :url
      t.string :username
      t.string :password
      t.date :expiration_date
      t.string :category_path
      t.string :tags
      t.boolean :favorite
      t.text :notes
      t.belongs_to :database, null: false, foreign_key: true

      t.timestamps
    end
  end
end
