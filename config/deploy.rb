set :application, "standfastusa.com"
set :deploy_to, "/var/www/vhosts/standfastusa.com/rails"
set :user, 'standfastusa'
set :group, 'psaserv'
set :rack_env, "production"
set :use_sudo, false
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :scm, :git
set :repository,  "git@github.com:stevenweber/standfast.git"
set :deploy_via, :remote_cache
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "copyright1984.com"                          # Your HTTP server, Apache/etc
role :app, "copyright1984.com"                          # This may be the same as your `Web` server
role :db,  "copyright1984.com", :primary => true        # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  task :bundle_gems do
    run "cd #{current_path} && bundle install --deployment"
  end
end

task :copy_database_yml do
  database_configuration = "/var/www/vhosts/standfastusa.com/conf/database.yml"
  run "ln -nfs #{database_configuration} #{release_path}/config/database.yml"
end

after "deploy:symlink", "deploy:bundle_gems"
after "deploy:finalize_update", :copy_database_yml
