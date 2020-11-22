class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      ## profile_information
      t.string :name
      t.string :introduction
      t.integer:profile_image_id

    end
  end
end
