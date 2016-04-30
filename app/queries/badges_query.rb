class BadgesQuery
  class << self
    def for_user(user)
      badges = []
      badges << Badge.find_by(name: 'teamhero') if top_teamhero_score.user_id == user.id
      badges << Badge.find_by(name: 'like a boss') if top_issue_score.user_id == user.id
      badges << Badge.find_by(name: 'men at work') if top_pr_score.user_id == user.id
    rescue ActiveRecord::RecordNotFound
      []
    end

    private
    def top_teamhero_score
      Score.find_by!(badge_type: 'teamhero')
    end

    def top_pr_score
      Score.find_by!(badge_type: 'pull_request')
    end

    def top_issue_score
      Score.find_by!(badge_type: 'issue')
    end
  end
end
