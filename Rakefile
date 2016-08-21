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
    population = XpTeamWise::Optimizer::Population.new(size: 16, members: members)
    XpTeamWise::Optimizer.run(population)

    File.open(task.name, 'w') do |file|
      file.puts "General satisfaction (score): #{population.fittest.score}\n\n"

      population.fittest.teams.each { |team| file.puts team.to_s }
    end
  end
end
