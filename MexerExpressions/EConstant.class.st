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
	^ self new value: 3
]

{ #category : #'as yet unclassified' }
EConstant class >> constant5 [
	^ self new value: 5
]

{ #category : #'as yet unclassified' }
EConstant class >> fourtyTwo [
	^ self new value: 42
]

{ #category : #'instance creation' }
EConstant class >> of: aValue [
	^ self new value: aValue
]

{ #category : #accessing }
EConstant class >> string [
	^ self new value: '"string"'
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
	^ value
]

{ #category : #'as yet unclassified' }
EConstant >> given: aTokenSymbol [ 
	^ aTokenSymbol givenConstant: self
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
