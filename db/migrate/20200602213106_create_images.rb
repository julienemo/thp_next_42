class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :uploaded_by, index: true, null: false, foreign_key: { to_table: :users }
      t.binary :stream, null: false
      t.string :extension, null: false
      t.string :description
      t.boolean :is_private, null: false, default: false
      t.timestamps
    end
    add_index :images, :is_private
    add_index :images, :uploaded_by
    add_index :images, :extension
  end
end
