require 'spec_helper'

describe Resources::Sync do

  let(:user) { create(:user) }

  it 'perform sync' do
    post '/api/sync', { authentication_token: user.authentication_token, last_sync_date: 0 }
    expect(response.code).to eq "200"
  end

  it 'return 400(bad request) if last_sync_date is null' do
    post '/api/sync', { authentication_token: user.authentication_token}
    expect(response.code).to eq "400"
    expect(JSON.parse(response.body)['message']).to eq "Invalid Params"
  end

  it 'return 400(bad request) if authentication_token is null' do
    post '/api/sync', { }
    expect(response.code).to eq "401"
    expect(JSON.parse(response.body)['message']).to eq "Unauthorized"
  end

end
