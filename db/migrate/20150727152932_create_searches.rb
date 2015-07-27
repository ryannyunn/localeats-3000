class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :ll
      t.string :near
      t.string :query
      t.integer :radius
      t.timestamps null: false
    end
  end
end
