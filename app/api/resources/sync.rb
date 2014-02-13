module Resources
  class Sync < API

    post :sync do
      authenticate!
      error!({message: 'Invalid Params'}, 400) if params[:last_sync_date].blank?
      if response = SyncData.new(@user, params[:last_sync_date]).perform_sync
        status(200)
        response
      else
        error!({message: 'Problem to sync data'}, 500)
      end
    end

  end
end
