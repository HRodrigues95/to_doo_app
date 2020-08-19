class Tag < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 16 },
                   uniqueness: true
  has_many :taglinks, dependent: :destroy
  has_many :todos, through: :taglinks

  def filter(dolist, param = {})
    res = todos
    res = res.where(dolist_id: dolist)
    res = res.where(done: param[:done]) unless param[:done].empty? || param[:done].nil?
    res.where('do_date >= ?', param[:date]) unless param[:date].empty? || param[:date].nil?
  end
end
