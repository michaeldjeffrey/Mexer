Class {
	#name : #ParserTest,
	#superclass : #TestCase,
	#category : #'MexerLexer-Tests'
}

{ #category : #tests }
ParserTest >> testAddition [
	| lexer |
	lexer := Lexer source: '5 + 3'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: (EAddition fivePlusThree)
]

{ #category : #tests }
ParserTest >> testFactorNumber [
	| lexer |
	lexer := Lexer source: '42'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: EConstant fourtyTwo
]

{ #category : #tests }
ParserTest >> testFactorString [
	| lexer |
	lexer := Lexer source: '"string"'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: EConstant string
]

{ #category : #tests }
ParserTest >> testMultipleAddition [
	| lexer |
	lexer := Lexer source: '5 + 3 + 1'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: (EAddition left: (EAddition left: 5 right: 3) right: 1)
]

{ #category : #tests }
ParserTest >> testMultipleMultiplication [
	| lexer |
	lexer := Lexer source: '5 * 3 * 1'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: (EMultiplication left: EMultiplication fiveTimesThree right: (EConstant value: 1))
]

{ #category : #tests }
ParserTest >> testMultiplication [
	| lexer |
	lexer := Lexer source: '5 * 3'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: EMultiplication fiveTimesThree
]

{ #category : #tests }
ParserTest >> testMultiplicationAndAddition [
	| lexer |
	lexer := Lexer source: '5 * 3 + 1'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: (EAddition left: EMultiplication fiveTimesThree right: (EConstant value: 1))
]
