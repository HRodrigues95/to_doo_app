class Dolist < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many   :todos, dependent: :destroy

  def filter(hash = {})
    col = todos
    col = todos.where(done: hash[:done]) unless hash[:done].empty? || hash[:done].nil?
    col.where('do_date >= ?', hash[:date]) unless hash[:date].empty? || hash[:date].nil?
  end
end
