namespace :db do
  desc 'Backs up the prd database and restores it on dev'
  task backup: :environment do
    `bash #{Rails.root}/bin/backup`
  end
end
