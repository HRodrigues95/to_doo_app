class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.references :dolist   , null: false, foreign_key: true
      t.text    :description , null: false
      t.boolean :done        , default: false

      t.timestamps
    end
  end
end
