class Score < ActiveRecord::Base
  belongs_to :user
  enum score_type: [:general, :weekly]
  enum badge_type: [:teamhero, :pull_request, :issue]
end
