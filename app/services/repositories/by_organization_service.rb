class Repositories::ByOrganizationService < Repositories::BaseService
  def initialize(user, organization_name)
    @user, @organization_name = user, organization_name
    super(@user)
  end

  def perform
    @result = Externals::RepositoryContainer.new(@client.org_repos(@organization_name))

    self
  end
end
