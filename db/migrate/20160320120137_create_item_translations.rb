class CreateItemTranslations < ActiveRecord::Migration
  def change
    create_table :item_translations do |t|
      t.string :name
      t.string :locale
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
