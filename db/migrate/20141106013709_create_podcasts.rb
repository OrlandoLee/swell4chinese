class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :keywords
      t.string :link

      t.timestamps
    end
  end
end
