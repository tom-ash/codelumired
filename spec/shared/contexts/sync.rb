require_relative '../examples/state.rb'

RSpec.shared_context 'sync', :shared_context => :metadata do
  let(:headers) do
    {
      'Route-Url': route,
      'Access-Token': accessToken,
    }
  end
  let(:body) { JSON.parse(response.body, symbolize_names: true) }
  let(:user_status) { visitor_status }
  let(:admin_status) { user_status }
  let(:visitor_state) do
    {
      app: visitor_app_data,
      render: visitor_render,
      user: visitor_user,
      control: visitor_control,
      assets: visitor_assets,
      links: visitor_links,
      texts: visitor_texts,
      data: visitor_data,
      inputs: visitor_inputs,
      errors: {},
      meta: {}, # meta preview
    }
  end
  let(:user_state) do
    {
      app: user_app_data,
      render: user_render,
      user: user_user,
      control: user_control,
      assets: user_assets,
      links: user_links,
      texts: user_texts,
      data: user_data,
      inputs: user_inputs,
      errors: {},
      meta: {}, # meta preview
    }
  end
  let(:user_app_data) { visitor_app_data }
  let(:user_render) { visitor_render }
  let(:user_user) { visitor_user }
  let(:user_control) { visitor_control }
  let(:user_assets) { visitor_assets }
  let(:user_links) { visitor_links }
  let(:user_texts) { visitor_texts }
  let(:user_data) { visitor_data }
  let(:user_inputs) { visitor_inputs }
  let(:admin_state) do
    {
      app: admin_app_data,
      render: admin_render,
      user: admin_user,
      control: admin_control,
      assets: admin_assets,
      links: admin_links,
      texts: admin_texts,
      data: admin_data,
      inputs: admin_inputs,
      errors: {},
      meta: {}, # meta preview
    }
  end
  let(:admin_app_data) { visitor_app_data }
  let(:admin_render) { visitor_render }
  let(:admin_user) { visitor_user }
  let(:admin_control) { visitor_control }
  let(:admin_assets) { visitor_assets }
  let(:admin_links) { visitor_links }
  let(:admin_texts) { visitor_texts }
  let(:admin_data) { visitor_data }
  let(:admin_inputs) { visitor_inputs }

  describe 'visitor' do
    let(:accessToken) { nil }
  
    include_examples 'state', 'visitor'
  end

  describe 'user' do
    let(:accessToken) { accessToken = ::Ciphers::Jwt::Encoder.new(id: user.id).call }

    include_examples 'state', 'user'
  end

  describe 'admin' do
    let(:accessToken) { accessToken = ::Ciphers::Jwt::Encoder.new(id: admin.id).call }

    include_examples 'state', 'admin'
  end
end
