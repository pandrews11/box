require 'spec_helper'

describe Box do
  it "should be able to log in" do
    user = Box::User.login 'blah', 'blah'
    expect(user).to_not be_nil
  end
end
