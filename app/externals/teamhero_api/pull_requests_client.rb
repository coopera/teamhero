module TeamheroAPI
  class PullRequestsClient < BaseClient
    def self.count(username)
      pull_request_count(username)
    end

    def self.current_week_count(username)
      current_week_pull_request_count(username)
    end
  end
end
