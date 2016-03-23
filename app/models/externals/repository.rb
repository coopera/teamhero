class Externals::Repository
  include ActiveAttr::Model

  attribute :id
  attribute :name
  attribute :full_name
  attribute :private
  attribute :html_url
  attribute :description
  attribute :open_issues
  attribute :watcher
end
