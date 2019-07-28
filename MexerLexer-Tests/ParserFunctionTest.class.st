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
