class Project < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :comments, dependent: :destroy
  has_many :project_statuses, dependent: :destroy
end
