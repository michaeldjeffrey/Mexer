Class {
	#name : #EVariable,
	#superclass : #EExpression,
	#instVars : [
		'id'
	],
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EVariable class >> id: aSymbol [
	^ self new id: aSymbol
]

{ #category : #printing }
EVariable >> evaluateWith: aBindingDictionary [
	^ aBindingDictionary at: id
]

{ #category : #printing }
EVariable >> id: aSymbol [
	id := aSymbol
]

{ #category : #printing }
EVariable >> printOn: aStream [
	aStream nextPutAll: id asString
]
