class CreateMusicComments < ActiveRecord::Migration[5.2]
  def change
    create_table :music_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :music_id

      t.timestamps
    end
  end
end
