class Tag < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 16 },
                   uniqueness: true
  has_many :taglinks, dependent: :destroy
  has_many :todos, through: :taglinks

  def filter
    
  end
  
end
