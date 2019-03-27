class CreateH2 < ActiveRecord::Migration[5.2]
  def change
    create_table :h2s do |t|
      t.string :value
      t.integer :page_id

      t.timestamps
    end
  end
end
