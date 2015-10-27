# Uncomment the lines below and set values appropriately

set :rails_env, "staging"

server "hlapi.pickingo.com", :web, :app, :db,primary: true

set :tld, "hlapi.pickingo.com"

set :branch, "develop"

set :rvm_ruby_string, "ruby-2.1.2@faisal"

# MySQL
set :mysql_user, "root"
set :mysql_root_password, "Pickingo%5"
set :mysql_password, "Pickingo%5"
set :mysql_database, "faisal_staging"
set :mysql_host, "faisal.cqzg3yzny9v9.us-west-2.rds.amazonaws.com"
set :mysql_encoding, "utf8"
set :mysql_connection_pool, 50

# PostgreSQL
# set :postgresql_user, "root"
# set :postgresql_password, "root"
# set :postgresql_database, ""
# set :postgresql_host, ""
# set :postgresql_encoding, "utf8"
# set :postgresql_connection_pool, 5