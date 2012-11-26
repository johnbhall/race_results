require 'yaml'

# the times from yaml are converted to seconds (fixnums). This gem allows us to display them in chrono time
require 'chronic_duration'

# ordinalize numbers: eg, convert 1 to 1st
require 'active_support/core_ext/integer/inflections'

before "index.html.erb" do
  @races = YAML.load_file('2012.yml').values.sort{|a, b| b['date'] <=> a['date']}
end
