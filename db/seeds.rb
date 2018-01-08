# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Workout.create(title: 'Push Up', description: 'Keep your back and your legs straight and aligned. Use your arms to push the Earth into the Sun.', video_url: 'https://upload.wikimedia.org/wikipedia/commons/b/b8/Liegestuetz02_ani_fcm.gif', wiki_link: 'https://en.wikipedia.org/wiki/Push-up', min_lvl: 0, min_reps: 5)
Workout.create(title: 'Sit Up', description: 'Lay on your back and bend your knees so that your feet are flat on the floor with your legs together. Bend in the middle, repeatedly.', video_url: 'http://i.imgur.com/7ir4oC9.gif', min_lvl: 2, min_reps: 5, wiki_link: 'https://en.wikipedia.org/wiki/Sit-up')
Workout.create(title: 'Pull Up', description: 'Find a sturdy thing that is above your head. Preferably something you can hang from. Bend your arms until your head is over that thing.', video_url: 'https://upload.wikimedia.org/wikipedia/commons/transcoded/f/fc/Navy-seal-buds-training-pull-ups.ogv/Navy-seal-buds-training-pull-ups.ogv.480p.webm', min_lvl: 10, min_reps: 1, wiki_link: 'https://en.wikipedia.org/wiki/Pull-up_(exercise)')
Workout.create(title: 'Dip', description: 'Sit on the edge of something that is not likely to slide. Put your arms behind you and grab that thing. Slide your butt forward so that you can bend your arms in a "dipping" motion. Do that repeatedly.', video_url: 'https://i.redd.it/twl7mm9tv5ty.gif', min_lvl: 3, min_reps: 5, wiki_link: 'https://en.wikipedia.org/wiki/Dip_(exercise)')
Workout.create(title: 'Jumping Jack', description: 'Jump up and down, flapping your arms and legs together and apart.', video_url: 'https://media3.giphy.com/media/md9Cmd4j7zIAw/giphy.gif', min_lvl: 1, min_reps: 5, wiki_link: 'https://en.wikipedia.org/wiki/Jumping_jack')
Workout.create(title: 'Kung Fu Move', description: 'Do a Kung Fu kata! Pretend you are battling a ninja.', video_url: 'https://media1.giphy.com/media/12a5NB63dmQojC/giphy.gif', min_lvl: 2, min_reps: 5, wiki_link: 'https://en.wikipedia.org/wiki/Chinese_martial_arts')