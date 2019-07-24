Class {
	#name : #TokenName,
	#superclass : #MyToken,
	#category : #'MexerLexer-Tokens'
}

{ #category : #'as yet unclassified' }
TokenName >> givenAssignment: anEAssignment [ 
	anEAssignment id: self.
	^ anEAssignment 
]
