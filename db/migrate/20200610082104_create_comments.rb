class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :user_name
      t.references :event, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
