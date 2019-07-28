Class {
	#name : #ParserObjectTest,
	#superclass : #TestCase,
	#category : #'MexerLexer-Tests'
}

{ #category : #tests }
ParserObjectTest >> testEmptyObject [
	| lexer |
	lexer := Lexer source: '{}'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: EObject empty.
]

{ #category : #tests }
ParserObjectTest >> testMultipleKeys [
	| lexer object |
	lexer := Lexer source: '{ foo: "string", bar: "string" }'.
	object := EObject empty.
	object at: (TokenName value: 'foo') put: EConstant string.
	object at: (TokenName value: 'bar') put: EConstant string.
	self assert: (Parser from: lexer allTokens) root equals: object
]

{ #category : #tests }
ParserObjectTest >> testNestedNestedObject [
	| lexer |
	lexer := Lexer source: '{ foo: { bar: { } } } }'.
	self
		assert: (Parser from: lexer allTokens) root
		equals:
			(EObject
				at: (TokenName value: 'foo')
				put: (EObject at: (TokenName value: 'bar') put: EObject empty))
]

{ #category : #tests }
ParserObjectTest >> testNestedObject [
	| lexer |
	lexer := Lexer source: '{ foo: {} }'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: (EObject at: (TokenName value: 'foo') put: EObject empty)
]

{ #category : #tests }
ParserObjectTest >> testNestedObjectWithKey [
	| lexer object nested |
	lexer := Lexer source: '{ foo: { bar: 5 } }'.
	self
		assert: (Parser from: lexer allTokens) root
		equals:
			(EObject
				at: (TokenName value: 'foo')
				put: (EObject at: (TokenName value: 'bar') put: EConstant constant5))
]

{ #category : #tests }
ParserObjectTest >> testSingleKey [
	| lexer object |
	lexer := Lexer source: '{ foo: "string" }'.
	object := EObject empty.
	object at: (TokenName value: 'foo') put: EConstant string.
	self assert: (Parser from: lexer allTokens) root equals: object
]
