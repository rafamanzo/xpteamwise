begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

require_relative 'src/xp_team_wise'

namespace :xpteamwise do
  input_data = Rake::FileList['*.csv']

  desc 'Reads the input CSV and returns the optimized teams on txt'
  task :generate => input_data.ext('.txt')

  rule '.txt' => '.csv' do |task|
    members = XpTeamWise::Data::Reader::CSVToData.read(task.source)

    File.open(task.name, 'w') do |file|
      members.each { |m| file.puts m.name }
    end
  end
end
