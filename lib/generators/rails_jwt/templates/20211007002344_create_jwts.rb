class CreateJwts < ActiveRecord::Migration[6.1]
  def change
    create_table :jwts do |t|
      t.string :token
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
