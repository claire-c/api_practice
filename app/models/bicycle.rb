# frozen_string_literal: true

class Bicycle < ApplicationRecord
  validates_presence_of :brand, :colour, :tyre_width
end
