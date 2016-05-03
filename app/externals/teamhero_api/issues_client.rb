module TeamheroAPI
  class IssuesClient < BaseClient
    def self.count(username)
      issue_count(username)
    end

    def self.current_week_count(username)
      current_week_issue_count(username)
    end
  end
end
