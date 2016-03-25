class Repositories::ByIDService < Repositories::BaseService
  def initialize(user, organization_name, project_name)
    @user, @organization_name, @project_name = user, organization_name, project_name
    super(@user)
  end

  def perform
    @result = Externals::RepositoryContainer.new(@client.org_repos(@organization_name)).find_by(name: @project_name)

    self
  end
end
