# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Workout.create(title: 'pushup', description: 'use your whole body to try and push the earth into the sun', video_url: 'pushups.com', min_lvl: 0, min_reps: 5)
Workout.create(title: 'situp', description: 'lay on your back and bend at the middle', video_url: 'situps.com', min_lvl: 0, min_reps: 5)
Workout.create(title: 'pullup', description: 'grab a fixed bar above your head and bend your arms until your head is over the bar', video_url: 'pullups.com', min_lvl: 5, min_reps: 1)
Workout.create(title: 'mountain climber', description: 'from the front leaning rest position, run in place', video_url: 'pain.com', min_lvl: 5, min_reps: 5)
Workout.create(title: 'side straddle hop', description: 'its a jumping jack', video_url: 'goarmy.com', min_lvl: 0, min_reps: 5)
Workout.create(title: 'kung fu', description: 'do ten seconds of random kung fu!', video_url: 'wataaa.com', min_lvl: 0, min_reps: 5)