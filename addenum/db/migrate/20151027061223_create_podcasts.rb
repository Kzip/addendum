class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :name
      t.string :description
      t.attachment :cast
      t.timestamps
    end
  end
end
