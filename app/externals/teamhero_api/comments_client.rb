module TeamheroAPI
  class CommentsClient < BaseClient
    def self.count(username)
      pull_request_comment_count(username) + issue_comment_count(username)
    end

    def self.current_week_count(username)
      current_week_comment_count(username)
    end
  end
end
