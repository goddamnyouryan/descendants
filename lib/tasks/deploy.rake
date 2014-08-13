namespace :deploy do
  desc 'Deploy the app to production'
  task :production do
    app = 'descendants'
    remote = "git@heroku.com:#{app}.git"

    system "git push #{remote} master"
    system "heroku run rake db:migrate --app #{app}"
  end

  desc 'Deploy the app to staging'
  task :staging do
    app = 'descendants-staging'
    remote = "git@heroku.com:#{app}.git"

    system "git push #{remote} master"
    system "heroku run rake db:migrate --app #{app}"
  end
end
