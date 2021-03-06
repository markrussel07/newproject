require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(name: "Example User", email: "@user@example.com", password: "Password", password_confirmation: "Confirm Password")
  end

  subject {@user}

  it { should respond_to(:name)}
  it { should respond_to(:email)}
  it { should respond_to(:password_digest)}
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation)}

  it { should be_valid}

  describe"when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid}
    end

    describe "when email is not present" do
      before { @user.email = " " }
      it { should_not be_valid}
    end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
            foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  it { should respond_to(:authenticate) }

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  describe "with a password that's to short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end




end

