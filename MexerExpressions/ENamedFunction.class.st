Class {
	#name : #ENamedFunction,
	#superclass : #EFunction,
	#category : #MexerExpressions
}

{ #category : #testing }
ENamedFunction >> isAnonymous [ 
	^ false
]

{ #category : #accessing }
ENamedFunction >> name [ 
	^ name value
]
