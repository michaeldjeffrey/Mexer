Class {
	#name : #ParserFunctionTest,
	#superclass : #TestCase,
	#category : #'MexerLexer-Tests'
}

{ #category : #tests }
ParserFunctionTest >> testEmptyFunctionDeclaration [
	| lexer |
	lexer := Lexer source: 'function name () { }'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: (EFunction named: 'name')
]

{ #category : #tests }
ParserFunctionTest >> testFunctionDeclarationWithArgument [
	| lexer func |
	lexer := Lexer source: 'function name (foo) { }'.
	func := EFunction named: 'name'.
	func addArgument: (TokenName value: 'foo').
	self
		assert: (Parser from: lexer allTokens) root
		equals: func
]

{ #category : #tests }
ParserFunctionTest >> testFunctionDeclarationWithExpression [
	| lexer func |
	lexer := Lexer source: 'function name () { 5 + 3; }'.
	func := EFunction named: 'name'.
	func addExpression: EAddition fivePlusThree.
	self assert: (Parser from: lexer allTokens) root equals: func
]

{ #category : #tests }
ParserFunctionTest >> testFunctionDeclarationWithMultipleArguments [
	| lexer func |
	lexer := Lexer source: 'function name (foo, bar) { }'.
	func := EFunction named: 'name'.
	func addArgument: (TokenName value: 'foo').
	func addArgument: (TokenName value: 'bar').
	self assert: (Parser from: lexer allTokens) root equals: func
]
