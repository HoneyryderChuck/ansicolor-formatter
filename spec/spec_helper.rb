# if coverage report is wanted
require "simplecov" if ENV['COVERAGE'] == "true"

require "bundler/setup"
Bundler.require(:default, :test)
require "ansicolor/formatter"

require "rspec/json_expectations"
require "rspec-html-matchers"

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
  config.include RSpecHtmlMatchers
end
