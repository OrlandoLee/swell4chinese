class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.integer :user_id
      t.integer :keyword_id
      t.integer :count

      t.timestamps
    end
  end
end
