Class {
	#name : #MyToken,
	#superclass : #Object,
	#instVars : [
		'value',
		'end',
		'start'
	],
	#category : #MexerLexer
}

{ #category : #accessing }
MyToken class >> value: aNumber [
	^ self new value: aNumber
]

{ #category : #comparing }
MyToken >> = aToken [
	^ self class = aToken class and: [ value = aToken value ]
]

{ #category : #accessing }
MyToken >> end [
	^ end
]

{ #category : #accessing }
MyToken >> end: anObject [
	end := anObject
]

{ #category : #printing }
MyToken >> printOn: aStream [
	aStream << self className;
	<< ' (';
	<< value;
	<< ')'.
]

{ #category : #accessing }
MyToken >> start [
	^ start
]

{ #category : #accessing }
MyToken >> start: anObject [
	start := anObject
]

{ #category : #accessing }
MyToken >> value [
	^ value
]

{ #category : #accessing }
MyToken >> value: anObject [
	value := anObject
]
