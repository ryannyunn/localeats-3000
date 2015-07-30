class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :content
      t.timestamps null: false
    end
  end
end
