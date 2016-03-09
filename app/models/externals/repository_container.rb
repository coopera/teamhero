class Externals::RepositoryContainer
  delegate :first, :last, :[], :count, to: :repos
  attr_reader :repos

  def initialize(repos)
    @repos = Array.wrap(repos).map{|r| Externals::Repository.new(r)}
  end

  def find_by(options)
    search_by(options).first
  end

  def search_by(options)
    @repos.select do |repo|
      options.all? {|attribute, value| repo.public_send(attribute) == value }
    end
  end
end
