Class {
	#name : #EObject,
	#superclass : #EExpression,
	#instVars : [
		'expressions',
		'waitingKey',
		'parent'
	],
	#category : #MexerExpressions
}

{ #category : #accessing }
EObject class >> at: aTokenName put: anExpression [
	^ self new at: aTokenName put: anExpression; yourself
]

{ #category : #'as yet unclassified' }
EObject class >> empty [
	^ self new
]

{ #category : #'as yet unclassified' }
EObject class >> withParent: anEObject [
	| object |
	object := self new parent: anEObject .
	anEObject put: object.
	^ object.
]

{ #category : #'as yet unclassified' }
EObject >> add: anExpression [
	expressions add: anExpression 
]

{ #category : #accessing }
EObject >> at: aTokenName put: anEConstant [
	expressions at: aTokenName put: anEConstant 
]

{ #category : #'as yet unclassified' }
EObject >> expressions [
	^ expressions
]

{ #category : #'as yet unclassified' }
EObject >> given: aToken [
	^ aToken givenObject: self
]

{ #category : #initialization }
EObject >> initialize [
	super initialize .
	expressions := OrderedDictionary new
]

{ #category : #'as yet unclassified' }
EObject >> parent [
	parent ifNil: [ ^ self ].
	^ parent
]

{ #category : #'as yet unclassified' }
EObject >> parent: anEObject [ 
	parent := anEObject 
]

{ #category : #printing }
EObject >> printOn: aStream [
	| tally |
	aStream nextPutAll: '{ '.
	tally := 0.
	expressions
		keysAndValuesDo: [ :key :value | 
			tally := tally + 1.
			aStream
				print: key;
				nextPutAll: ': ';
				print: value.
			tally = expressions size
				ifFalse: [ aStream nextPutAll: ', ' ] ].
	aStream nextPutAll: ' }'.
	waitingKey
		ifNotNil: [ aStream
				nextPutAll: ' (waiting on: ';
				print: waitingKey;
				nextPutAll: ')' ]
]

{ #category : #accessing }
EObject >> put: anEConstant [
	expressions at: self waitingKey  put: anEConstant
]

{ #category : #'as yet unclassified' }
EObject >> waitingKey [
	"Don't want to get caught with a key responding to multiple values"
	| temp |
	temp := waitingKey.
	waitingKey := nil.
	^ temp
]

{ #category : #accessing }
EObject >> waitingKey: aTokenName [
	waitingKey := aTokenName 
]
