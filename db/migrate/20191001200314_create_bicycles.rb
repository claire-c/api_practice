# frozen_string_literal: true

class CreateBicycles < ActiveRecord::Migration[5.2]
  def change
    create_table :bicycles do |t|
      t.string :brand
      t.string :colour
      t.integer :tyre_width

      t.timestamps
    end
  end
end
