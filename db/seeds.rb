# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear the database
Project.destroy_all
User.destroy_all

# Populate the database
user = User.create!(first_name: "Seed", last_name: "User", email: "seed@example.com", password: "Seed123")
user_2 = User.create!(first_name: "Another", last_name: "User", email: "another_seed@example.com", password: "Seed123")

project = Project.create!(name: "Test Project", description: "A test project for the Homey technical takehome test")

UserProject.create!(user: user, project: project)

questions_and_answers = [
  {
    question: "What attributes do you think we should store against the user?",
    answer: "Let's keep it simple for now and store their name, email address, and password (encrypted). We can use Devise for authentication as it's an industry standard."
  },
  {
    question: "Do we need to split the users name by first and last name?",
    answer: "Yes, let's store the first_name and last_name separately so that we can address the user by their first_name in any personalisation e.g. emails."
  },
  {
    question: "When a user is destroyed should we nullify their comments instead of destroying them?",
    answer: "Yes, if we nullify them then we still keep a record of the comment, e.g. if an employee was to leave the company their account can be removed but we can keep a record of their project comments so we understand the context of other comments against the project."
  },
  {
    question: "When a user is destroyed should we nullify their project_statuses instead of destroying them?",
    answer: "Yes, if we nullify them then we still keep a record of the project_status change, e.g. if an employee was to leave the company their account can be removed but we can keep a record of their project status changes."
  },
  {
    question: "Should we have the ability to have custom status only allow selection from a list of preset statuses (enum of Todo, In Progress, Complete)?",
    answer: "For now we will assume that the generic project statuses we have within the enum is enough. Realistically we won't need to update this too often. If we need to add a new project status to the enum then that is a simple change. In the future, if we wanted to allow users to set statuses themselves we can revisit the modelling then."
  },
  {
    question: "Should this be displayed on the UI as a combined list (comments and status updates) or split into two lists?",
    answer: "Lets combine these for now. We can pull the project status changes from the ProjectStatus table and pull the conversation history from the Comment table. We can combine these in a single array sorted by create_at datetime (displaying the latest first). Once we have the feature live we can test with our users to see what they think and adjust if necessary."
  },
]

ProjectStatus.create(user: user_2, project: project, status: "pending")
questions_and_answers.each_with_index do |qa, index|
  Comment.create(user: user, project: project, description: qa[:question])
  Comment.create(user: user_2, project: project, description: qa[:answer])
  if index == 2
    ProjectStatus.create(user: user, project: project, status: "active")
  end
end
