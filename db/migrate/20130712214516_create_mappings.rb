class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.integer :api_id
      t.string  :name
      t.string  :klass
      t.string  :selector
      t.timestamps
    end
  end
end
