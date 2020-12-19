require 'capybara'
require 'capybara/rspec'
require 'capybara/sessionkeeper'
require 'capybara-screenshot'
require 'allure-rspec'
require 'allure-ruby-adaptor-api'
require_relative '../Infra/Configuration/Configuration.rb'
require_relative '../Infra/Common/Utils.rb'
require_relative '../Infra/Base/BaseTest.rb'

RSpec.configure do |config|
  include BaseTest

  config.expect_with :rspec do |expectations|    
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  
  config.mock_with :rspec do |mocks|    
    mocks.verify_partial_doubles = true
  end
  
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do 
    BeforeSuite()
    page.current_window.resize_to(1280,768)
  end

  config.before(:context) do
    BeforeContext()
  end

  config.before(:example) do    
    BeforeExample()
  end

  config.after(:example) do|e| 
    AfterExample(e)
  end

  config.after(:suite) do
    AfterSuite()
  end

  config.formatter = AllureRspecFormatter

  config.include Capybara::DSL  

  config.include Capybara::Screenshot  
end

Capybara.configure do |config|
  config.default_driver = $browser
  config.default_max_wait_time = $seconds_to_wait
  config.save_path = $print_path
  config.app_host = $server
  config.reuse_server = !$close_browser_after_test
end

Capybara.register_driver :$browser do |app|
  Capybara::Selenium::Driver.new(app, browser: $browser)  
end

# AllureRubyAdaptorApi.configure do |c|
#   c.output_dir = "allure-results"
# end
AllureRspec.configure do |config|
  config.clean_results_directory = $clean_report_files
end