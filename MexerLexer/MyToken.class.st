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

{ #category : #'as yet unclassified' }
MyToken >> asConstant [
	^ EConstant value: self
]

{ #category : #accessing }
MyToken >> end [
	^ end
]

{ #category : #accessing }
MyToken >> end: anObject [
	end := anObject
]

{ #category : #'as yet unclassified' }
MyToken >> given: aToken [
	^ aToken asStarter.
]

{ #category : #printing }
MyToken >> printInsideOn: aStream [
	aStream << value asString.
]

{ #category : #printing }
MyToken >> printOn: aStream [
	aStream << self className;
	<< ' ('.
	self printInsideOn: aStream.
	aStream
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
