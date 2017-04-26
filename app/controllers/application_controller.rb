class ApplicationController < ActionController::API
  CURRENT_LOCATION = "europe"
  around_filter :select_shard

  def select_shard(&block)
    Octopus.using(CURRENT_LOCATION.to_sym, &block)
  end
end
