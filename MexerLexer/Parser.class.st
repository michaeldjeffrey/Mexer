Class {
	#name : #Parser,
	#superclass : #Object,
	#instVars : [
		'tokens',
		'stack',
		'isParsed'
	],
	#category : #MexerLexer
}

{ #category : #'as yet unclassified' }
Parser class >> from: aCollectionOfTokens [
	^ self new tokens: aCollectionOfTokens
]

{ #category : #'as yet unclassified' }
Parser >> expression [
	^ EConstant new value: tokens first value
]

{ #category : #initialization }
Parser >> initialize [ 
	isParsed := false.
	stack := OrderedCollection new.
]

{ #category : #accessing }
Parser >> isParsed [
	^ isParsed
]

{ #category : #parsing }
Parser >> parse [
	^ tokens
		inject: MyToken new into: [ :one :two | one given: two ]
]

{ #category : #'as yet unclassified' }
Parser >> root [
	^ self parse.
]

{ #category : #'as yet unclassified' }
Parser >> tokens: aCollection [ 
	tokens := aCollection 
]
