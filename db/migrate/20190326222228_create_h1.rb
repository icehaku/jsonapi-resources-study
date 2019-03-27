class CreateH1 < ActiveRecord::Migration[5.2]
  def change
    create_table :h1s do |t|
      t.string :value
      t.integer :page_id

      t.timestamps
    end
  end
end
