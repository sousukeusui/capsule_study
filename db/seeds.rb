# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach('/Users/yoshidasuguru/Documents/capsule_study_data.csv',headers: true) do |row|
    Question.create!(
        subject: row['教科'],
        problem: row['問題'],
        answer: row['答え'],
        mistake1: row['不正解1'],
        mistake2: row['不正解2'],
        mistake3: row['不正解3']

    )
end