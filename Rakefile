# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

Rake::Task["db:test:prepare"].clear
Rake::Task["db:test:load"].clear
Rake::Task["db:test:purge"].clear
