require 'rails_helper'

RSpec.describe Truck, type: :model do
  it 'has a name, cuisine, and menu' do
    expect{Truck.create!(name: "", cuisine: "", menu: "")}.to raise_error
  end

end
