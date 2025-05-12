class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos do |t|
      t.string :image
      t.text :caption
      t.integer :owner_id

      t.timestamps
    end
  end
end
