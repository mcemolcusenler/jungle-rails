require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should be valid with all the fields" do
      @user = User.new(
        name: "Haso",
        email: "Haso@example.com",
        password: "passw0rd",
        password_confirmation: "passw0rd"
      )
      expect(@user).to be_valid
    end

    it "should not be valid without a name" do
      @user = User.new(
        email: "Haso@example.com",
        password: "passw0rd",
        password_confirmation: "passw0rd"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "should not be valid without an email" do
      @user = User.new(
        name: "Haso",
        password: "passw0rd",
        password_confirmation: "passw0rd"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should not be valid without a password" do
      @user = User.new(
        name: "Haso",
        email: "Haso@example.com",
        password_confirmation: "passw0rd"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not be valid without a password confirmation" do
      @user = User.new(
        name: "Haso",
        email: "Haso@example.com",
        password: "passw0rd"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "should be valid if password and password confirmation are the same" do
      @user = User.new(
        name: "Haso",
        email: "Haso@example.com",
        password: "passw0rd",
        password_confirmation: "passw0rd"
      )
      expect(@user).to be_valid
    end

    it "should not be valid if password and password confirmation are not the same" do
      @user = User.new(
        name: "Haso",
        email: "Haso@example.com",
        password: "passw0rd",
        password_confirmation: "haso"
      )
      expect(@user).to_not be_valid
    end

    it "should not be valid if email address has already been used" do
      @user1 = User.new(
        name: "Haso",
        email: "Haso@example.com",
        password: "passw0rd",
        password_confirmation: "passw0rd"
      )
      @user1.save!
      @user2 = User.new(
        name: "Bilo",
        email: "HASO@example.com",
        password: "passw0rd",
        password_confirmation: "passw0rd"
      )
      expect(@user2).to_not be_valid
    end

    it "should not be valid if password is less than 6 characters" do
      @user = User.new(
        name: "Haso",
        email: "Haso@example.com",
        password: "pass",
        password_confirmation: "pass"
      )
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should return the user if user is already registered" do
      @user = User.new(
        name: "Melimelo",
        email: "melimelo@example.com",
        password: "melimelo",
        password_confirmation: "melimelo"
      )
      @user.save!
      user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user).to be_truthy
    end

    it "should be valid if user email has white-space at the beginnign or end" do
      @user = User.new(
        name: "Melimelo",
        email: "melimelo@example.com",
        password: "melimelo",
        password_confirmation: "melimelo"
      )
      @user.save!
      user = User.authenticate_with_credentials(" melimelo@example.com ", @user.password)
      expect(user).to be_truthy
    end

    it "should be valid if user email has wrong cap characters" do
      @user = User.new(
        name: "Melimelo",
        email: "melimelo@example.com",
        password: "melimelo",
        password_confirmation: "melimelo"
      )
      @user.save!
      user = User.authenticate_with_credentials("melimelo@examPle.cOm", @user.password)
      expect(user).to be_truthy
    end
  end
end
