require 'yaml'

# the times from yaml are converted to seconds (fixnums). This gem allows us to display them in chrono time
require 'chronic_duration'

before "index.html.erb" do
  @races = YAML.load_file('2012.yml').values.sort{|a, b| b['date'] <=> a['date']}
end
