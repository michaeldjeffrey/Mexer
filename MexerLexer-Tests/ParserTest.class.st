Class {
	#name : #ParserTest,
	#superclass : #TestCase,
	#category : #'MexerLexer-Tests'
}

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
