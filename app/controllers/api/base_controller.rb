class BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  def has_valid_api_key?
    p request.headers['X-Api-Key'] == Settings.LIBRARY_CLIENT_ID
  end
  def validate_api_key!
    return head :forbidden unless has_valid_api_key?
  end
  end
