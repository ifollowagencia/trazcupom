class SyncData

  def initialize(user, last_sync_date)
    @user = user
    @last_sync_date = last_sync_date
  end

  def perform_sync
    fetch_offers
    fetch_establishments
    fetch_downloads
    response
  end

  def response
    {
      user: @user,
      offers: @offers,
      establishments: @establishments
    }
  end

  private

  def fetch_offers
    @offers ||= Offer.newest(@last_sync_date)
  end

  def fetch_establishments
    @establishment ||= Establishment.newest(@last_sync_date)
  end

  def fetch_downloads
    @downloads ||= Download.newest(@last_sync_date)
  end
end
