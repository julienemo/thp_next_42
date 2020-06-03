class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :author, index: true, null: false, foreign_key: { to_table: :users }
      t.belongs_to :image
      t.string :content, null: false
      t.integer :parent_id, index: true
      t.timestamps
    end
  end
end
