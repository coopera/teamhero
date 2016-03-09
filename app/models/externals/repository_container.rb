class Externals::RepositoryContainer
  attr_reader :repos

  def initialize(repos)
    @repos = Array.wrap(repos).map{|r| Externals::Repository.new(r)}
  end

  def find_by(attr_name, value)
    search_by(attr_name, value)
  end

  def search_by(attr_name, value)
    @repos.select {|repo| repo.public_send(attr_name) == value }
  end
end
