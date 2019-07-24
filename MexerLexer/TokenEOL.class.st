Class {
	#name : #TokenEOL,
	#superclass : #MyToken,
	#category : #'MexerLexer-Tokens'
}

{ #category : #initialization }
TokenEOL >> initialize [ 
	value := 'EOL'
]

{ #category : #'as yet unclassified' }
TokenEOL >> isAlphaNumeric [
	^ false
]

{ #category : #'as yet unclassified' }
TokenEOL >> isDigit [
	^ false
]

{ #category : #'as yet unclassified' }
TokenEOL >> isLetter [
	^ false
]

{ #category : #'as yet unclassified' }
TokenEOL >> isSeparator [
	^ false
]
