Class {
	#name : #EFunctionTest,
	#superclass : #TestCase,
	#category : #'MexerExpressions-Tests'
}

{ #category : #tests }
EFunctionTest >> testCreationAnonymousWithMessage [
	| object |
	object := EFunction anonymous.
	self assert: object isAnonymous.
]

{ #category : #tests }
EFunctionTest >> testCreationNamedWithMessage [
	| object |
	object := EFunction named: (TokenName value: 'foo').
	self deny: object isAnonymous.
	self assert: object expressions equals: EFunctionBody new.
]

{ #category : #tests }
EFunctionTest >> testPrintingAnonymous [
	| object |
	object := EFunction anonymous.
	self
		assert: object printString
		equals: 'function __anonymous__ () {}'
]

{ #category : #tests }
EFunctionTest >> testPrintingAnonymousWithExpression [
	| object assignment |
	object := EFunction anonymous.
	assignment := EAssignment new
		type: (TokenSymbol value: 'var');
		id: (TokenName value: 'name');
		value: EConstant fourtyTwo.
	object addExpression: assignment.
	self
		assert: object printString
		equals:
			(String crlf
				join:
					#('function __anonymous__ () {' '	TokenSymbol (var) TokenName (name) = TokenNumber (42);' '}'))
]

{ #category : #tests }
EFunctionTest >> testPrintingNamed [
	| object |
	object := EFunction named: (TokenName value: 'foo').
	self
		assert: object printString
		equals: 'function foo () {}'
]

{ #category : #tests }
EFunctionTest >> testPrintingNamedWithArguments [
	| object |
	object := EFunction named: (TokenName value: 'foo').
	object addArgument: (TokenName value: 'bar').
	self assert: object printString equals: 'function foo (TokenName (bar)) {}'
]

{ #category : #tests }
EFunctionTest >> testPrintingNamedWithExpression [
	| object assignment |
	object := EFunction named: (TokenName value: 'foo').
	assignment := EAssignment new
		type: (TokenSymbol value: 'var');
		id: (TokenName value: 'name');
		value: EConstant fourtyTwo.
	object addExpression: assignment.
	self
		assert: object printString
		equals:
			(String crlf
				join:
					#('function foo () {' '	TokenSymbol (var) TokenName (name) = TokenNumber (42);' '}'))
]

{ #category : #tests }
EFunctionTest >> testPrintingNamedWithMultipleArguments [
	| object |
	object := EFunction named: (TokenName value: 'foo').
	object addArgument: (TokenName value: 'bar').
	object addArgument: (TokenName value: 'baz').
	self
		assert: object printString
		equals: 'function foo (TokenName (bar), TokenName (baz)) {}'
]
