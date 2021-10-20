class FileUpload < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_one_attached :excel_file
end
