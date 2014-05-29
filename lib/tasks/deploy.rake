namespace :deploy do
  desc 'Deploy the app'
  task :production do
    app = 'descendants'
    remote = "git@heroku.com:#{app}.git"

    system "git push #{remote} master"
    system "heroku run rake db:migrate --app #{app}"
  end
end
