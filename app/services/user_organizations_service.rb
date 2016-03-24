class UserOrganizationsService < ApplicationService
  def initialize(user)
    @client = Octokit::Client.new(access_token: user.token)
  end

  def perform
    @result = @client.organizations.map {|o| Externals::Organization.new o}

    self
  end
end
