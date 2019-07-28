Class {
	#name : #TokenName,
	#superclass : #MyToken,
	#category : #'MexerLexer-Tokens'
}

{ #category : #'as yet unclassified' }
TokenName >> givenAnonymousFunction: anEAnonymousFunction [ 
	^ anEAnonymousFunction named: self
]

{ #category : #'as yet unclassified' }
TokenName >> givenAssignment: anEAssignment [ 
	anEAssignment id: self.
	^ anEAssignment 
]

{ #category : #'as yet unclassified' }
TokenName >> givenObject: anEObject [
	anEObject waitingKey: self.
	^ anEObject 
]

{ #category : #accessing }
TokenName >> value [ 
	^ value
]
