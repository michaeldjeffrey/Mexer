Class {
	#name : #EConstant,
	#superclass : #EExpression,
	#instVars : [
		'value'
	],
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EConstant class >> constant3 [
	<sampleInstance>
	^ self new value: (TokenNumber value: 3)
]

{ #category : #'as yet unclassified' }
EConstant class >> constant5 [
	<sampleInstance>
	^ self new
		value: (TokenNumber value: 5);
		yourself
]

{ #category : #'as yet unclassified' }
EConstant class >> fourtyTwo [
	<sampleInstance>
	^ self new value: (TokenNumber value: 42)
]

{ #category : #'instance creation' }
EConstant class >> of: aValue [
	^ self new value: aValue
]

{ #category : #accessing }
EConstant class >> string [
	<sampleInstance>
	^ self new value: (TokenString value: '"string"')
]

{ #category : #'as yet unclassified' }
EConstant class >> value: anInteger [ 
	^ self new value: anInteger
]

{ #category : #'public access' }
EConstant >> evaluate [ 
	^ self value
]

{ #category : #'as yet unclassified' }
EConstant >> evaluateWith: anObject [
	^ value value
]

{ #category : #'as yet unclassified' }
EConstant >> given: aTokenSymbol [ 
	^ aTokenSymbol givenConstant: self
]

{ #category : #'as yet unclassified' }
EConstant >> givenAssignment: anEAssignment [ 
	^ value givenAssignment: anEAssignment 
]

{ #category : #'as yet unclassified' }
EConstant >> givenSymbol: aTokenSymbol [
	"We know symbols handle constant already"
	^ aTokenSymbol givenConstant: self
]

{ #category : #printing }
EConstant >> printOn: aStream [
	aStream print: value
]

{ #category : #evaluating }
EConstant >> value [ 	
	^ value
]

{ #category : #'as yet unclassified' }
EConstant >> value: anInteger [ 
	value := anInteger
]
