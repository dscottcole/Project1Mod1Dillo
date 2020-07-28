require_relative 'config/environment.rb'
require "sinatra/activerecord/rake"

desc "start console"
task :console do
  Pry.start
end


desc 'set reset db'
task :teser do
  Rake::Task["db:environment:set"].invoke
  Rake::Task["db:reset"].invoke
end