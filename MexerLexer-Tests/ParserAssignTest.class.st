Class {
	#name : #ParserAssignTest,
	#superclass : #TestCase,
	#category : #'MexerLexer-Tests'
}

{ #category : #tests }
ParserAssignTest >> testConstAssign [
	| lexer |
	lexer := Lexer source: 'const name = 42'.
	self
		assert: (Parser from: lexer allTokens) root
		equals:
			(EAssignment new
				type: (TokenKeyword value: 'const');
				id: (TokenName value: 'name');
				value: (TokenNumber value: 42))
]

{ #category : #tests }
ParserAssignTest >> testConstAssignMathValue [
	| lexer |
	lexer := Lexer source: 'const name = 5 + 3'.
	self
		assert: (Parser from: lexer allTokens) root
		equals:
			(EAssignment new
				type: (TokenKeyword value: 'const');
				id: (TokenName value: 'name');
				value: EAddition fivePlusThree)
]

{ #category : #tests }
ParserAssignTest >> testLetAssign [
	| lexer |
	lexer := Lexer source: 'let name = 42'.
	self
		assert: (Parser from: lexer allTokens) root
		equals:
			(EAssignment new
				type: (TokenKeyword value: 'let');
				id: (TokenName value: 'name');
				value: (TokenNumber value: 42))
]

{ #category : #tests }
ParserAssignTest >> testLetAssignMathValue [
	| lexer |
	lexer := Lexer source: 'let name = 5 * 3'.
	self
		assert: (Parser from: lexer allTokens) root
		equals:
			(EAssignment new
				type: (TokenKeyword value: 'let');
				id: (TokenName value: 'name');
				value: EMultiplication fiveTimesThree )
]

{ #category : #tests }
ParserAssignTest >> testVarAssign [
	| lexer |
	lexer := Lexer source: 'var name = 42'.
	self
		assert: (Parser from: lexer allTokens) root
		equals:
			(EAssignment new
				type: (TokenKeyword value: 'var');
				id: (TokenName value: 'name');
				value: (TokenNumber value: 42))
]
