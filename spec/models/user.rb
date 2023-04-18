require 'swagger_helper'

RSpec.describe User do
  it 'User should be valid' do
    user = User.create(name: '',
                       email: '',
                       password: '')
    expect(user).to_not be_valid
  end

  it 'User should have a name' do
    user = User.create(name: 'Admin',
                       email: 'Admin@email.com',
                       password: '123123')
    expect(user.name).to eql('Admin')
  end

  it 'should have an email' do
    user = User.create(name: 'Admin',
                       email: 'Admin@email.com',
                       password: '123123')
    expect(user.email).to eql('Admin@email.com')
  end

  it 'should have a password' do
    user = User.create(name: 'Admin',
                       email: 'Admin@email.com',
                       password: '123123')
    expect(user.password).to eql('123123')
  end
end
