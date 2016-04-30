module TeamheroAPI
  class BaseClient
    include HTTParty
    base_uri ENV.fetch('TEAMHERO_API_URL')
    
    %w(pull_request issue pull_request_comment issue_comment).each do |event|
      define_singleton_method("#{event}_count") do |username, start_date = nil, end_date = nil|
        get_events_count(event, username, start_date, end_date)
      end

      define_singleton_method("current_week_#{event}_count") do |username|
        start_date = Date.current.beginning_of_week.to_param
        end_date = Date.current.end_of_week.to_param
        send("#{event}_count", username, start_date, end_date)
      end
    end

    class << self
      protected

      def get_events_count(event_name, username, start_date, end_date)
        query = {author: username}
        if start_date.present? && end_date.present?
          query.merge!(after: start_date, before: end_date)
        end
        options = {query: query}

        get("/count/#{event_name}", options)
      end
    end
  end
end
