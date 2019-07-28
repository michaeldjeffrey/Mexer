Class {
	#name : #EArgumentListTest,
	#superclass : #TestCase,
	#category : #'MexerExpressions-Tests'
}

{ #category : #tests }
EArgumentListTest >> testCreation [ 
	| list |
	list := EArgumentList new.
	self assert: list arguments equals: OrderedCollection new.
]

{ #category : #tests }
EArgumentListTest >> testEmptyPrinting [
	| list |
	list := EArgumentList new.
	self assert: list printString equals: '()'
]

{ #category : #tests }
EArgumentListTest >> testMultipleArgumentPrinting [
	| list |
	list := EArgumentList new.
	list add: (TokenName value: 'foo').
	list add: (TokenName value: 'bar').
	self assert: list printString equals: '(TokenName (foo), TokenName (bar))'
]

{ #category : #tests }
EArgumentListTest >> testSingleArgumentPrinting [
	| list |
	list := EArgumentList new.
	list add: (TokenName value: 'foo').
	self assert: list printString equals: '(TokenName (foo))'
]
