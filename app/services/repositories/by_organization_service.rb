class Repositories::ByOrganizationService < Repositories::BaseService
  def initialize(user, organization_name)
    @user, @organization_name = user, organization_name
    super(@user)
  end

  def perform
    @result = @client.org_repos(@organization_name)

    self
  end
end
