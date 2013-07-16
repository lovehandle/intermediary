class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis, id: false do |t|
      t.binary :uuid, limit: 16, primary: true
      t.string :name
      t.text   :description
      t.string :url
      t.string :selector
      t.timestamps
    end
  end
end
