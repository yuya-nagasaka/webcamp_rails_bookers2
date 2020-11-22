class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
