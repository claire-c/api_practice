class CreateJsonObjects < ActiveRecord::Migration[5.2]
  def change
    create_table :json_objects do |t|
      t.string :json_string
    end
  end
end
