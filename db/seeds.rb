# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Criação de um usuário
User.create!(
    email: 'rbrajao@gmail.com',
    encrypted_password: 'teste123',
    role: 'admin',
    status: true
  )

