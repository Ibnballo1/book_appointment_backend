require 'rails_helper'

RSpec.describe User do
  it 'User should be valid' do
    user = User.create(name: '',
                       email: '',
                       password: '')
    expect(user).to_not be_valid
  end
end