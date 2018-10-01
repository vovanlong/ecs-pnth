class CreateSuggests < ActiveRecord::Migration[5.2]
  def change
    create_table :suggests do |t|
      t.references :user, foreign_key: true
      t.string :content
      t.integer :status
      t.string :image

      t.timestamps
    end
  end
end
