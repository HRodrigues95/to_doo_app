class Todo < ApplicationRecord
  belongs_to :dolist
  validates :description, presence: true, length: { minimum: 5, maximum: 255 }
  has_many :taglinks, dependent: :destroy
  has_many :tags, through: :taglinks

  def all_tags=(names)
    self.tags = names.split(',').reject(&:blank?).map do |name|
      Tag.where(name: name.strip)
         .first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end
end
