led_zepp = Band.create!(name: 'Led Zeppelin')
led_zepp.add_album('Led Zeppelin IV')

lz4_tracklist = [
  "Black Dog",
  "Rock And Roll",
  "The Battle Of Evermore",
  "Stairway To Heaven",
  "Misty Mountain Hop",
  "Four Sticks",
  "Going To California",
  "When The Levee Breaks"
]

Album.find_by_name('Led Zeppelin IV').add_tracks(lz4_tracklist)
