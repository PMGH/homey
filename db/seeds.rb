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
user = User.create!(first_name: "Seed", last_name: "User", email: "test@example.com", password: "Seed123")

project = Project.create!(name: "Test Project")

UserProject.create!(user: user, project: project)
