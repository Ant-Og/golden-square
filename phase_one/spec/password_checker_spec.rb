require "password_checker"

RSpec.describe PasswordChecker do
  it "checks that password lenth that is greater or equal to 8 returns true" do
    password =  PasswordChecker.new
    result = password.check("password")
    expect(result).to eq true
  end

	it "checks that password lenth is less than 8 returns fail" do
		password = PasswordChecker.new
		expect { password.check("7") }.to raise_error "Invalid password, must be 8+ characters."
	end
end
