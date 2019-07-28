Class {
	#name : #EAnonymousFunction,
	#superclass : #EFunction,
	#category : #MexerExpressions
}

{ #category : #testing }
EAnonymousFunction >> isAnonymous [ 
	^ true
]

{ #category : #accessing }
EAnonymousFunction >> name [
	^ '__anonymous__'
]
