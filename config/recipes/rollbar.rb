task :notify_rollbar, :roles => :app do
  set :revision, `git log -n 1 --pretty=format:"%H"`
  set :local_user, `whoami`
  set :rollbar_token, 'ef16ac6dc4b848a58f29a05f1782b60a'
  rails_env = fetch(:rails_env, 'production')
  run "curl https://api.rollbar.com/api/1/deploy/ -F access_token=#{rollbar_token} -F environment=#{rails_env} -F revision=#{revision} -F local_username=#{local_user} >/dev/null 2>&1", :once => true
end

after :deploy, 'notify_rollbar'