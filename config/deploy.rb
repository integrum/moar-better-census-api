require 'bundler/capistrano'

set :application, "moar-better-census-api"
set :repository,  "git@github.com:integrum/moar-better-census-api.git"

set :user, 'deploy'
set :use_sudo, false

set :deploy_to, "/home/deploy/apps/#{application}"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "173.255.203.234"                          # Your HTTP server, Apache/etc
role :app, "173.255.203.234"                          # This may be the same as your `Web` server
role :db,  "173.255.203.234", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
after "deploy:finalize_update", "deploy:symlinks"
after "deploy:update_code", "deploy:migrate"
after "deploy", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :symlinks do
    run "ln -nsf #{shared_path}/config/database.yml #{current_release}/config/database.yml"
  end
end
