namespace :carrierwave do 
  task :uploads_folder do
    run "mkdir -p #{deploy_to}/#{shared_dir}/uploads"
    run "#{sudo} chmod 775 #{deploy_to}/#{shared_dir}/uploads"
  end
  after 'deploy:setup', 'carrierwave:uploads_folderx'

  task :symlink do 
    #run "ln -nfs #{deploy_to}/#{shared_dir}/uploads #{release_path}/public/uploads"
    run "ln -nfs #{deploy_to}/#{shared_dir}/public/uploads #{release_path}/public/uploads"
  end
  after 'deploy', 'carrierwave:symlink'
end
