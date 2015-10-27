# Uncomment the lines below and set values appropriately

set :rails_env, "production"

server "ec2-52-88-52-104.us-west-2.compute.amazonaws.com", :web, :app, :db,primary: true

set :tld, "ec2-52-88-52-104.us-west-2.compute.amazonaws.com"

set :branch, "master"

set :rvm_ruby_string, "ruby-2.1.2@crm"

# MySQL
set :mysql_user, "root"
set :mysql_root_password, "pranab16"
set :mysql_password, "pranab16"
set :mysql_database, "crm_production"
set :mysql_host, "localhost"
set :mysql_encoding, "utf8"
set :mysql_connection_pool, 20

# PostgreSQL
# set :postgresql_user, "root"
# set :postgresql_password, "root"
# set :postgresql_database, ""
# set :postgresql_host, ""
# set :postgresql_encoding, "utf8"
# set :postgresql_connection_pool, 5