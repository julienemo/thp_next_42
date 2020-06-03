class Image < ApplicationRecord
  belongs_to :uploaded_by, class_name: 'User'
  has_many :comments
end
