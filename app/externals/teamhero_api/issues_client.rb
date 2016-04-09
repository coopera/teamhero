module TeamheroAPI
  class IssuesClient < BaseClient
    def self.count(username, repository)
      get_events_count(:issues, username, repository)
    end
  end
end
