namespace :solr do

  desc "start solr"
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && service solr start"
  end

  desc "stop solr"
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && service solr stop "
  end

  desc "restart"
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end

  desc "reindex the whole database"
  task :reindex, :roles => :app do
    # stop
    # run "rm -rf #{shared_path}/solr/data"
    # start
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake sunspot:solr:reindex"
  end

end

namespace :deploy do
  task :setup_solr_data_dir do
    run "mkdir -p #{shared_path}/solr/data"
  end
end

after 'deploy:setup', 'deploy:setup_solr_data_dir'
after 'deploy', 'solr:start'