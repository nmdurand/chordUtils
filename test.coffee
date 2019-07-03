Chord = require './src/chord'
Note = require './src/note'


myChord = new Chord
	root: 'A'
	ext: 'm7'
	transpo: 4
	preferredAccidental: ''

console.log '>> First chord Name:', myChord.getName()

myChord2 = new Chord 'Bm7b5/F'
myChord2.setTranspo -3
myChord2.setPreferredAccidental 'b'

console.log '>> Second chord Name:', myChord2.getName()
