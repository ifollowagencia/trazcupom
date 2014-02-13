module Resources
  class Sync < API

    post :sync do
      authenticate!
      error!({message: 'Invalid Params'}, 400) if params[:last_sync_date].blank?
      response = SyncData.new(@user, params[:last_sync_date]).perform_sync
      if response
        status(200)
        response
      else
        status(400)
        { message: 'problem to perform sync' }
      end
    end

  end
end
