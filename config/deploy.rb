require 'capistrano-unicorn'
require 'capistrano-nginx-unicorn'

set :application, '162.243.115.252'

set :keep_releases, 2

set :scm, :git

set :repository, 'git@github.com:ifollowagencia/trazcupom.git'

set :branch, 'master'

set :deploy_via, :remote_cache

set :deploy_to, '/var/www/trazcupom'

set :current, "#{deploy_to}/current"

set :user, 'root'

# Minhas configurações do Unicorn
# comando para execução do unicorn
# <optinal>
set :unicorn_binary,  "bundle exec unicorn"
# caminho para o arquivo de configuração do unicorn
# <optinal>
set :unicorn_config,  "#{current}/config/unicorn.rb"
# onde será armazenado o pid do processo do unicorn
# <optinal>
set :unicorn_pid,     "#{deploy_to}/shared/pids/unicorn.pid"

role :web, application

role :app, application

role :db,  application, primary: true

after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'   # app preloaded
after 'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented (zero downtime deployments)

namespace :deploy do

  ## News methods ->

  #starta a aplicação com o unicorn
  desc "Start Application"
  task :start, :roles => :app, :except => { :no_release => true } do 
    # comando bash, navega ate a pasta da versao atual, e executa o unicorn
    run "cd #{current_path} && #{try_sudo} #{unicorn_binary} -c #{unicorn_config}" <<
        " -E #{rails_env} -D"
  end
  
  # mata o serviço do unicorn
  desc "Stop Application"
  task :stop, :roles => :app, :except => { :no_release => true } do 
    # mata o serviço do unicorn passando o pid definido na linha 99
     #run "#{try_sudo} kill `cat #{unicorn_pid}`"
     run "if [ -e /var/www/cupom/shared/pids/unicorn.pid ]; then kill `cat /var/www/cupom/shared/pids/unicorn.pid`; fi;"
  end
  
  # mata o serviço do unicorn apos axecuções atual
  desc "Graceful Stop Application"
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end
  
  # reinicia o serviço do unicorn
  task :restart, :roles => :app, :except => { :no_release => true } do
    # para o serviço
    stop
    # starta o serviço
    start
  end

  # verifica as pasta necessarias para o envio, e inicialização do s serviços
  # para corrigir bug que aconteceu comigo, talvez ja tenham corrigido esse erro
  desc "Creating folders necessary"
  task :check_folders do
    run "if [ ! -d '#{deploy_to}' ];then mkdir #{deploy_to}; fi"
    run "if [ ! -d '#{deploy_to}/#{version_dir}' ];then mkdir #{deploy_to}/#{version_dir}; fi"
    run "if [ ! -d '#{deploy_to}/#{shared_dir}' ];then mkdir #{deploy_to}/#{shared_dir}; fi"
    run "if [ ! -d '#{deploy_to}/#{shared_dir}/pids' ];then mkdir #{deploy_to}/#{shared_dir}/pids; fi"
    run "if [ ! -d '#{deploy_to}/#{shared_dir}/log' ];then mkdir #{deploy_to}/#{shared_dir}/log; fi"
  end
end

namespace :ruby do
  desc "Show ruby version"
  task :version do
    run "cd #{current_release} && ruby -v"
  end
  desc "List process (sla) on server"
  task :list do
    run "top"
  end
end

namespace :unicorn do
  desc "Show error log"
  task :error_log, :except => { :no_release => true } do
    run "cat #{deploy_to}/#{shared_dir}/log/unicorn.stderr.log"
  end

  desc "Show out log"
  task :out_log, :except => { :no_release => true } do
    run "cat #{deploy_to}/#{shared_dir}/log/unicorn.stdout.log"
  end
end