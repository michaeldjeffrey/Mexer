Class {
	#name : #ENamedFunction,
	#superclass : #EFunction,
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
ENamedFunction >> given: aToken [
	^ aToken givenNamedFunction: self
]

{ #category : #testing }
ENamedFunction >> isAnonymous [ 
	^ false
]

{ #category : #accessing }
ENamedFunction >> name [ 
	^ name value
]
