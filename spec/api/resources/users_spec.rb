require 'spec_helper'

describe Resources::Users do
  let(:user) { create(:user) }
  it "valid route" do
    post '/api/users/login', user: { email: user.email, password: user.password }
    expect(response.code).to eq "200"
    expect(JSON.parse(response.body)).to include('authentication_token')
  end
end
