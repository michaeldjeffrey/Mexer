Class {
	#name : #EAnonymousFunction,
	#superclass : #EFunction,
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EAnonymousFunction >> given: aToken [
	^ aToken givenAnonymousFunction: self
]

{ #category : #testing }
EAnonymousFunction >> isAnonymous [ 
	^ true
]

{ #category : #accessing }
EAnonymousFunction >> name [
	^ '__anonymous__'
]

{ #category : #'as yet unclassified' }
EAnonymousFunction >> named: aTokenName [ 
	| func |
	func := EFunction named: aTokenName.
	func fromDeclaration: declaration.
	^ func
]
