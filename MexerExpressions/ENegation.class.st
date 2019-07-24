Class {
	#name : #ENegation,
	#superclass : #EExpression,
	#instVars : [
		'expression'
	],
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
ENegation >> evaluateWith: aCollection [ 
	^ (expression evaluateWith: aCollection) negated
]

{ #category : #'as yet unclassified' }
ENegation >> expression: anEConstant [ 
	expression := anEConstant
]

{ #category : #'as yet unclassified' }
ENegation >> negated [
	^ expression
	
]

{ #category : #'as yet unclassified' }
ENegation >> printOn: aStream [
	aStream nextPutAll: '- '.
	aStream print: expression
]
