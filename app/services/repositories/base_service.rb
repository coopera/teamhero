class Repositories::BaseService < ApplicationService
  def initialize(user)
    @client = Octokit::Client.new(access_token: user.token)
  end
end
