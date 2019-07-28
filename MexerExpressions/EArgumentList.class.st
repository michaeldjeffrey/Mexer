Class {
	#name : #EArgumentList,
	#superclass : #EExpression,
	#instVars : [
		'arguments',
		'declaration'
	],
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EArgumentList >> add: aTokenName [ 
	arguments add: aTokenName 
]

{ #category : #accessing }
EArgumentList >> arguments [ 
	^ arguments
]

{ #category : #'as yet unclassified' }
EArgumentList >> declaration: anEFunction [ 
	declaration := anEFunction
]

{ #category : #initialization }
EArgumentList >> initialize [ 
	super initialize.
	arguments := OrderedCollection new.
]

{ #category : #printing }
EArgumentList >> printOn: aStream [
	| tally size |
	aStream nextPutAll: '('.
	tally := 0.
	size := arguments size.
	arguments
		do: [ :arg | 
			tally := tally + 1.
			aStream print: arg.
			tally = size
				ifFalse: [ aStream nextPutAll: ', ' ] ].
	aStream nextPutAll: ')'
]
