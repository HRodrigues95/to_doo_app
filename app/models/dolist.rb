class Dolist < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many   :todos, dependent: :destroy

  # `hash` is a very generic name for a param/variable, given that the param itself is a hash
  # If this method filters across ALL
  def filter(hash = {})
    col = todos
    # `#nil?` already reports if a given object is `#empty?`
    col = todos.where(done: hash[:done]) unless hash[:done].empty? || hash[:done].nil?
    col.where('do_date >= ?', hash[:date]) unless hash[:date].empty? || hash[:date].nil?
  end
end
