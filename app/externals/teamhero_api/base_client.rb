module TeamheroAPI
  class BaseClient
    include HTTParty
    base_uri ENV.fetch('TEAMHERO_API_URL')

    class << self
      def pull_requests_count(username, repository)
        get_events_count(:pull_requests, username, repository)
      end

      def comments_count(username, repository)
        get_events_count(:comments, username, repository)
      end

      def issues_count(username, repository)
        get_events_count(:issues, username, repository)
      end

      protected

      def get_events_count(event_name, username, repository)
        options = {query: {actor: username, repository: repository}}
        response = get("/#{event_name}/count", options)

        response['count']
      end
    end
  end
end
