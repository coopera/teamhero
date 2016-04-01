class CreateBadgesUsers < ActiveRecord::Migration
  def change
    create_table :badges_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :badge, index: true, foreign_key: true
    end
  end
end
