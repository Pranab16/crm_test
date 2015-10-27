after "deploy:stop",    "rpush:stop"
after "deploy:start",   "rpush:start"
after "deploy:restart", "rpush:restart"

namespace :rpush do
  desc "start rpush"
  task :start, :roles => :app, :except => {:no_release => true} do
    run "cd #{current_path} &&  rpush start -e #{rails_env}"
  end

  desc "stop rpush"
  task :stop, :roles => :app, :except => {:no_release => true} do
    run "cd #{current_path} &&  rpush stop -e #{rails_env}"
  end

  desc "restart rpush"
  task :restart, :roles => :app, :except => {:no_release => true} do
    stop
    start
  end
end