class CreateAddendums < ActiveRecord::Migration
  def change
    create_table :addendums do |t|
      t.string :name
      t.string :description
      t.attachment :addendum
      t.belongs_to :podcast, index:true
      t.timestamps
    end
  end
end
