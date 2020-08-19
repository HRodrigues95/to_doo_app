class AddDoDateToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :do_date, :date
  end
end
