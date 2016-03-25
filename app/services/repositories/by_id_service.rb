class Repositories::ByIDService < Repositories::BaseService
  def initialize(user, organization_name, project_id)
    @user, @organization_name, @project_id = user, organization_name, project_id
    super(@user)
  end

  def perform
    @result = Externals::RepositoryContainer.new(@client.org_repos(@organization_name)).find_by(id: @project_id)

    self
  end
end
