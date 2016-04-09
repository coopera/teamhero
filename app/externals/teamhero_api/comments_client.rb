module TeamheroAPI
  class CommentsClient < BaseClient
    def self.count(username, repository)
      get_events_count(:comments, username, repository)
    end
  end
end
