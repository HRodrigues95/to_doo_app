class Dolist < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many   :todos, dependent: :destroy
end
