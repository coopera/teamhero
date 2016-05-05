class BadgesQuery
  class << self
    def for_user(user)
      badges = []
      badges << badge_for('teamhero', top_teamhero_score, user)
      badges << badge_for('like a boss', top_issue_score, user)
      badges << badge_for('men at work', top_pr_score, user)
      badges << badge_for('IMHO', top_comment_score, user)
      badges.compact
    end

    private

    def badge_for(badge_name, score, user)
      Badge.find_by(name: badge_name) if score.present? && score.user_id == user.id
    end

    def top_teamhero_score
      Score.where(badge_type: 'teamhero').order('points DESC').first
    end

    def top_pr_score
      Score.where(badge_type: 'pull_request').order('points DESC').first
    end

    def top_issue_score
      Score.where(badge_type: 'issue').order('points DESC').first
    end

    def top_comment_score
      Score.where(badge_type: 'comment').order('points DESC').first
    end
  end
end
