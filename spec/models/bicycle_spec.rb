# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bicycle, type: :model do
  it { should validate_presence_of(:brand) }
  it { should validate_presence_of(:colour) }
  it { should validate_presence_of(:tyre_width) }
end
