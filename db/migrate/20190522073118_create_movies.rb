class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.string :url
      t.text :sources
      t.integer :user_id

      t.timestamps
    end
  end
end
