class Todo < ApplicationRecord
  belongs_to :dolist

  validates :description, presence: true, length: { minimum: 5, maximum: 255 }

  def self.done?
    done
  end
end
