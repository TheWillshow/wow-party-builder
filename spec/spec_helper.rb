require 'capybara'
require 'factory_girl_rails'
require 'coveralls'
require 'vcr_setup'
require 'omniauth-oauth2'

Coveralls.wear!('rails')
OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:bnet, {"provider"=>"bnet",
 "uid"=>"123456",
 "info"=>{"id"=>123456, "battletag"=>"User#1234"},
 "credentials"=>{"token"=>"sfgasfhadfh", "expires_at"=>nil, "expires"=>true},
 "extra"=>{}}
 )

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    config.before(:suite) do
     DatabaseCleaner.strategy = :transaction
     DatabaseCleaner.clean_with(:truncation)
    end

    config.around(:each) do |example|
     DatabaseCleaner.cleaning do
      example.run
     end
    end
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end
end
