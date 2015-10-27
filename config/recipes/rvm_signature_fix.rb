namespace :rvm_signature_fix do
  desc "Install everything onto the server"
  task :install_signature do
    run "gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3"
  end
end

after 'deploy:install', 'rvm_signature_fix:install_signature'