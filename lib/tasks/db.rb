namespace :db do
  desc "Migrate the active record database to the latest version"
  task migrate: :environment do
    ActiveRecord::Migrator.migrate [App.root.join('db/migrate')]
  end
end