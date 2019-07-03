_ = require 'lodash'

notes = [
	['C']
	['C#', 'Db']
	['D']
	['D#', 'Eb']
	['E']
	['F']
	['F#', 'Gb']
	['G']
	['G#', 'Ab']
	['A']
	['A#', 'Bb']
	['B']
]

# Define positive modulus function
modulus = (n,m)->
	((n % m) + m) % m

module.exports =

	transpose: (note, semitones, preferredAccidental = '#')->
		noteIndex = _.findIndex notes, (noteArray)->
			noteArray.includes note

		unless noteIndex is -1
			noteIndex = modulus (noteIndex + semitones), notes.length
		else
			throw new Error "Couldn't transpose note."

		transposedNotes = notes[noteIndex]
		if transposedNotes.length is 1
			return transposedNotes[0]
		else
			tester = new RegExp preferredAccidental
			result = _.find transposedNotes, (noteName)-> tester.test noteName
			if result?
				return result
			else
				return transposedNotes[0]
