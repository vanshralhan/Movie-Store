# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Movie.create(title: "The Pursuit of Happyness",year: "2006",genre: "Biography",cast: "Will Smith, Jaden Smith, Thandie Newton, Brian Howe",plot: "A struggling salesman takes custody of his son as he's poised to begin a life-changing professional career.",remote_image_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ5NjQ0NDI3NF5BMl5BanBnXkFtZTcwNDI0MjEzMw@@._V1_SX300.jpg",rating: "8.0",web: "http://www.sonypictures.com/movies/thepursuitofhappyness/")

Movie.create(title: "Guardians of the Galaxy Vol. 2",year: "2017",genre: "Action",cast: "Chris Pratt, Zoe Saldana, Dave Bautista, Vin Diesel",plot: "The Guardians must fight to keep their newfound family together as they unravel the mystery of Peter Quill's true parentage.",remote_image_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTg2MzI1MTg3OF5BMl5BanBnXkFtZTgwNTU3NDA2MTI@._V1_SX300.jpg",rating: "7.8",web: "https://marvel.com/guardians")

Movie.create(title: "The Avengers",year: "2012",genre: "Action",cast: "Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth",plot: "Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.",remote_image_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTk2NTI1MTU4N15BMl5BanBnXkFtZTcwODg0OTY0Nw@@._V1_SX300.jpg",rating: "8.1",web: "http://marvel.com/avengers_movie")

Movie.create(title: "John Wick",year: "2014",genre: "Action",cast: "Keanu Reeves, Michael Nyqvist, Alfie Allen, Willem Dafoe",plot: "An ex-hitman comes out of retirement to track down the gangsters that took everything from him.",remote_image_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_SX300.jpg",rating: "7.3",web: "http://johnwickthemovie.com/")


Movie.create(title: "John Wick Chapter 2: Wick-vizzed",year: "2017",genre: "Action",cast: "J.J. Perry, Keanu Reeves, Ruby Rose, Chad Stahelski",plot: "A candid look at rehearsal footage in support of a focus on pre-viz.",remote_image_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BZDlmY2VhMGMtMjU1Yi00ZGQ5LTg1ODYtOGZjZDlmZGNlZmE2XkEyXkFqcGdeQXVyODA1NjQ0OTY@._V1_SX300.jpg",rating: "8.1",web: "http://johnwickthemovie.com/")

Movie.create(title: "The Bourne Identity",year: "2002",genre: "Action",cast: "Matt Damon, Franka Potente, Chris Cooper, Clive Owen",plot: "A man is picked up by a fishing boat, bullet-riddled and suffering from amnesia, before racing to elude assassins and regain his memory.",remote_image_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BM2JkNGU0ZGMtZjVjNS00NjgyLWEyOWYtZmRmZGQyN2IxZjA2XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg",rating: "7.9",web: "http://www.thebourneidentity.com/")

Movie.create(title: "The Bourne Supremacy",year: "2004",genre: "Action",cast: "Matt Damon, Franka Potente, Brian Cox, Julia Stiles",plot: "When Jason Bourne is framed for a CIA operation gone awry, he is forced to resume his former life as a trained assassin to survive.",remote_image_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BYTIyMDFmMmItMWQzYy00MjBiLTg2M2UtM2JiNDRhOWE4NjBhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",rating: "7.8",web: "http://www.thebournesupremacy.com/")
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?