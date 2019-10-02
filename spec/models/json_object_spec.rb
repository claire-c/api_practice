require 'rails_helper'

RSpec.describe JsonObject, type: :model do
  it { should validate_presence_of(:json_string) }
end
