class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :image

  validates :content, presence: true

  def parent
    Comment.find(parent_id) if parent_id
  end

  def children
    result = Comment.select { |comment| comment.parent_id == id }
    return nil if result.length.zero?

    result
  end
end
