Class {
	#name : #EAssignment,
	#superclass : #EExpression,
	#instVars : [
		'type',
		'id',
		'value'
	],
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EAssignment >> given: aToken [
	^ aToken givenAssignment: self
]

{ #category : #accessing }
EAssignment >> id [
	^ id
]

{ #category : #accessing }
EAssignment >> id: anObject [
	id := anObject
]

{ #category : #printing }
EAssignment >> printOn: aStream [
	aStream
		print: type;
		nextPutAll: ' ';
		print: id;
		nextPutAll: ' = ';
		print: self value
]

{ #category : #accessing }
EAssignment >> type [
	^ type
]

{ #category : #accessing }
EAssignment >> type: anObject [
	type := anObject
]

{ #category : #accessing }
EAssignment >> value [
	^ value
]

{ #category : #accessing }
EAssignment >> value: anObject [
	value := anObject.
]
