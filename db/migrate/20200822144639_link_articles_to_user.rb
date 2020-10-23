class LinkArticlesToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :articles do |t|
      t.references :user, foreign_key: true
    end


  end
end
