module TeamheroAPI
  class CommentsClient < BaseClient
    def self.count(username)
      comment_count(username, nil, nil)
    end

    def self.current_week_count(username)
      current_week_comment_count(username)
    end
  end
end
