class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :url_origin
      t.text :values

      t.timestamps
    end
  end
end
