class ProjectStatus < ApplicationRecord
  belongs_to :user
  belongs_to :project

  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }
end
