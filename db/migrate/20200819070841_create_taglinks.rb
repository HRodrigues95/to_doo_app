class CreateTaglinks < ActiveRecord::Migration[6.0]
  def change
    create_table :taglinks do |t|
      t.references :todo, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
