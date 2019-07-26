Class {
	#name : #ParserMathTest,
	#superclass : #TestCase,
	#category : #'MexerLexer-Tests'
}

{ #category : #tests }
ParserMathTest >> testAddition [
	| lexer |
	lexer := Lexer source: '5 + 3'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: (EAddition fivePlusThree)
]

{ #category : #tests }
ParserMathTest >> testDivision [
	| lexer |
	lexer := Lexer source: '5 / 3'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: EDivision fiveDividedByThree
]

{ #category : #tests }
ParserMathTest >> testMultipleAddition [
	| lexer |
	lexer := Lexer source: '5 + 3 + 1'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: (EAddition left: (EAddition left: 5 right: 3) right: 1)
]

{ #category : #tests }
ParserMathTest >> testMultipleDivision [
	| lexer |
	lexer := Lexer source: '5 / 3 / 1'.
	self
		assert: (Parser from: lexer allTokens) root
		equals:
			(EDivision left: EDivision fiveDividedByThree  right: (EConstant value: 1))
]

{ #category : #tests }
ParserMathTest >> testMultipleMultiplication [
	| lexer |
	lexer := Lexer source: '5 * 3 * 1'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: (EMultiplication left: EMultiplication fiveTimesThree right: (EConstant value: 1))
]

{ #category : #tests }
ParserMathTest >> testMultipleSubtraction [
	| lexer |
	lexer := Lexer source: '5 - 3 - 1'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: (ESubtraction left: (ESubtraction left: 5 right: 3) right: 1)
]

{ #category : #tests }
ParserMathTest >> testMultiplication [
	| lexer |
	lexer := Lexer source: '5 * 3'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: EMultiplication fiveTimesThree
]

{ #category : #tests }
ParserMathTest >> testMultiplicationAndAddition [
	| lexer |
	lexer := Lexer source: '5 * 3 + 1'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: (EAddition left: EMultiplication fiveTimesThree right: (EConstant value: 1))
]

{ #category : #tests }
ParserMathTest >> testSubtraction [
	| lexer |
	lexer := Lexer source: '5 - 3'.
	self
		assert: (Parser from: lexer allTokens) root
		equals: ESubtraction fiveMinusThree
]
