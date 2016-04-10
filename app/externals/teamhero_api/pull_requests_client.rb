module TeamheroAPI
  class PullRequestsClient < BaseClient
    def self.count(username, repository)
      get_events_count(:pull_requests, username, repository)
    end
  end
end
