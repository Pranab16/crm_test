require "bundler/capistrano"
require 'capistrano/ext/multistage'

# Uncomment the packages that you require. Do not comment out any package
load "config/recipes/base"

# RVM settings
load "config/recipes/rvm_signature_fix"
load "config/recipes/rvm"

# Nginx
load "config/recipes/nginx"
# load "config/recipes/nginx_with_https"

# Unicorn
load "config/recipes/unicorn"

# Postgres
# load "config/recipes/postgresql"

#Solr
#load "config/recipes/solr"

#Redis
#load "config/recipes/redis"

# MySQL
load "config/recipes/mysql"

# Memcached
# load "config/recipes/memcached"

# JS env
#load "config/recipes/nodejs"

# Logrotate
load "config/recipes/logrotate"

# Run rake task on the server cap <production|staging> rake_task task=<task_name>
load "config/recipes/rake"

# Delayed Job
#load "config/recipes/delayed_job"

# Rpush
#load "config/recipes/rpush"

# Memcached
# load "config/recipes/memcached"

# Sidekiq
# load "config/recipes/sidekiq"

# Upstart
# load "config/recipes/upstart"

# Whenever
#load "config/recipes/whenever"

# Airbrake
#load "config/recipes/airbrake"

# Rollbar
#load "config/recipes/rollbar"

# New Relic
# load "config/recipes/newrelic"

# Git check
load "config/recipes/check"

# Change as per your application
set :application, "crm"
set :repository,  "https://github.com/Pranab16/crm_test.git"

# Don't change this
set :stages, %w(production staging)
set :default_stage, "staging"
set :user, "ubuntu"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :scm, "git"
default_run_options[:pty] = true
set :ssh_options, { forward_agent: true, paranoid: true, keys: "~/.ssh/id_rsa" }

# Don't change this
after "deploy", "deploy:migrate"
after "deploy", "deploy:cleanup" #keep only the last 5 releases

# Uncomment if using Airbrake
# require './config/boot'
# require 'airbrake/capistrano'
