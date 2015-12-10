class AddPodpageToPodcasts < ActiveRecord::Migration
  def change
    add_reference :podcasts, :podpage, index: true
  end
end
