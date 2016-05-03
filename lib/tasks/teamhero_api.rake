namespace :teamhero_api do
  desc "Get data from Teamhero API"
  task import: :environment do
    TeamheroAPI::Crawler.call
  end

end
