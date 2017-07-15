# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "ruby-rogues"
set :repo_url, "git@gitlab.com:denysmk/ruby-rogues.git"

# If the environment differs from the stage name
set :rails_env, "production"

# Defaults to :db role
set :migration_role, :app

# Defaults to the primary :db server
set :migration_servers, -> { primary(fetch(:migration_role)) }

# Defaults to false
# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, true

# Defaults to [:web]
set :assets_roles, [:web, :app]

set :stages, %w(production)
set :default_stage, "production"

# set :rvm_map_bins, fetch(:rvm_map_bins, []).push('rvmsudo')

# Default deploy_to directory is /var/www/my_app

set :deploy_to, "/var/www/ruby-rogues"

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

set :ssh_options, forward_agent: true

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, "2.4.1"

# in case you want to set ruby version from the file:
# set :rbenv_ruby, File.read('.ruby-version').strip

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all
