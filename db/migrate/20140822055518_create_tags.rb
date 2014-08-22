class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :point1
      t.string :point2
      t.string :point3
      t.string :point4
      t.string :point5

      t.timestamps
    end
    
    add_index :tags, :point1
    add_index :tags, :point2
    add_index :tags, :point3
    add_index :tags, :point4
    add_index :tags, :point5
  end
end
