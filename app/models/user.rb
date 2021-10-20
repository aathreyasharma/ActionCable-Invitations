class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable, :trackable, :lockable
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, presence: true, uniqueness: {case_sensitive: false}
  # belongs_to :managed_by, class_name: 'User', optional: true
  has_many :invitations, :class_name => self.to_s, :as => :invited_by
  has_many :file_uploads, foreign_key: :created_by_id
end
