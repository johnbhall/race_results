require 'yaml'

# the times from yaml are converted to seconds (fixnums). This gem allows us to display them in chrono time
require 'chronic_duration'

# ordinalize numbers: eg, convert 1 to 1st
require 'active_support/core_ext/integer/inflections'

# number_with_delimiter
require 'action_view'

ignore "Gemfile", "Gemfile.lock", "README"

before "index.html.erb" do
  results_files = Dir['results/*.yml']
  results = results_files.inject([]){ |memo, loc| memo + YAML.load_file(loc).values }
                          .sort{ |a, b| b['date'] <=> a['date'] }
  @results_by_year = results.group_by{ |result| result['date'].year }
end

before "recent.html.erb" do
  results_files = Dir['results/*.yml']
  @results = results_files.inject([]){ |memo, loc| memo + YAML.load_file(loc).values }
                          .sort{ |a, b| b['date'] <=> a['date'] }[0,4]
end

helpers do
  include ActionView::Helpers::NumberHelper
end