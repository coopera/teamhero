module TeamheroAPI
  class Crawler
    class << self
      def call
        users.each do |user|
          pr_points = pull_request_count(user.nickname)
          issue_points = issue_count(user.nickname)
          comment_points = comment_count(user.nickname)
          teamhero_points = (pr_points * 4) + (issue_points * 2) + comment_points

          pull_request_score(user).update_attributes(points: pr_points)
          issue_score(user).update_attributes(points: issue_points)
          comment_score(user).update_attributes(points: comment_points)
          teamhero_score(user).update_attributes(points: teamhero_points)
        end
      end

      private

      def users
        @users ||= User.all
      end

      def current_week_pull_request_count(username)
        TeamheroAPI::PullRequestsClient.current_week_count(username)
      end

      def pull_request_count(username)
        TeamheroAPI::PullRequestsClient.count(username)
      end

      def current_week_issue_count(username)
        TeamheroAPI::IssuesClient.current_week_count(username)
      end

      def issue_count(username)
        TeamheroAPI::IssuesClient.count(username)
      end

      def current_week_comment_count(username)
        TeamheroAPI::CommentsClient.current_week_count(username)
      end

      def comment_count(username)
        TeamheroAPI::CommentsClient.count(username)
      end

      def teamhero_score(user)
        find_or_create_score(user.id, Score.score_types[:general], Score.badge_types[:teamhero])
      end

      def pull_request_score(user)
        find_or_create_score(user.id, Score.score_types[:general], Score.badge_types[:pull_request])
      end

      def issue_score(user)
        find_or_create_score(user.id, Score.score_types[:general], Score.badge_types[:issue])
      end

      def comment_score(user)
        find_or_create_score(user.id, Score.score_types[:general], Score.badge_types[:comment])
      end

      def find_or_create_score(user_id, score_type, badge_type)
        Score.where(
          user_id: user_id,
          score_type: score_type,
          badge_type: badge_type).first_or_create
      end
    end
  end
end
