require 'rspec'

require File.join(File.dirname(__FILE__), '../../lib/mail_validation')

describe MailValidation::EmailValidator do
  class User
    include ActiveModel::Model
    attr_accessor :email
    validates :email, 'MailValidation::Email' => true
  end

  it 'adds an error if the email is blank' do
    user = User.new
    expect(user).to_not be_valid
  end

  it 'adds an error if the email is localized' do
    user = User.new.tap do |u|
      u.email = 'bademail'
    end

    expect(user).to_not be_valid
  end

  it 'adds an error if the email is invalid' do
    user = User.new.tap do |u|
      u.email = '@.com'
    end

    expect(user).to_not be_valid
  end

  it 'does not add an error for a valid, nonlocal email' do
    user = User.new.tap do |u|
      u.email = 'johnny@example.com'
    end

    expect(user).to be_valid
  end
end
