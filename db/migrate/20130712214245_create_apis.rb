class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :selector
      t.timestamps
    end
  end
end
