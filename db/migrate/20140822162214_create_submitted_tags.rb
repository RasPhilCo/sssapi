class CreateSubmittedTags < ActiveRecord::Migration
  def change
    create_table :submitted_tags do |t|
      t.string :dots
      t.string :point1
      t.string :point2
      t.string :point3
      t.string :point4
      t.string :point5

      t.timestamps
    end
    
    add_index :submitted_tags, :dots
    add_index :submitted_tags, :point1
    add_index :submitted_tags, :point2
    add_index :submitted_tags, :point3
    add_index :submitted_tags, :point4
    add_index :submitted_tags, :point5
  end
end
