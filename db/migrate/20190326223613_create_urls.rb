class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :value
      t.integer :page_id

      t.timestamps
    end
  end
end
