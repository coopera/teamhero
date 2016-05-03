class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :badge_type
      t.integer :points
      t.references :user, index: true, foreign_key: true
      t.integer :score_type

      t.timestamps null: false
    end
  end
end
