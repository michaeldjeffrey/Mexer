Class {
	#name : #LexerTest,
	#superclass : #TestCase,
	#category : #'MexerLexer-Tests'
}

{ #category : #tests }
LexerTest >> testAllTokens [
	| lexer expected |
	lexer := Lexer source: 'var foo = "string"'.
	expected := OrderedCollection new.
	expected add: (TokenKeyword value: #var).
	expected add: (TokenName value: 'foo').
	expected add: (TokenSymbol value: #=).
	expected add: (TokenString value: '"string"').
	
	self assert: lexer allTokens equals: expected.
]

{ #category : #tests }
LexerTest >> testLexFunctionToTokens [
	| lexer |
	lexer := Lexer source: 'function add(a, b) { return a + b; }'.
	self assert: lexer next equals: (TokenKeyword value: #function).
	self assert: lexer next equals: (TokenName value: 'add').
	self assert: lexer next equals: (TokenSymbol leftParen).
	self assert: lexer next equals: (TokenName value: 'a').
	self assert: lexer next equals: (TokenSymbol comma).
	self assert: lexer next equals: (TokenName value: 'b').
	self assert: lexer next equals: (TokenSymbol rightParen).
	self assert: lexer next equals: (TokenSymbol leftCurly).
	self assert: lexer next equals: (TokenKeyword value: #return).
	self assert: lexer next equals: (TokenName value: 'a').
	self assert: lexer next equals: (TokenSymbol plus).
	self assert: lexer next equals: (TokenName value: 'b').
	self assert: lexer next equals: (TokenSymbol semiColon).
	self assert: lexer next equals: (TokenSymbol rightCurly).
	
	
	
]

{ #category : #tests }
LexerTest >> testLexFunctionWithNewlinesToTokens [
	| lexer |
	lexer := Lexer source: 'function add(a, b) { 
	return a + b; 
	}'.
	self assert: lexer next equals: (TokenKeyword value: #function).
	self assert: lexer next equals: (TokenName value: 'add').
	self assert: lexer next equals: (TokenSymbol leftParen).
	self assert: lexer next equals: (TokenName value: 'a').
	self assert: lexer next equals: (TokenSymbol comma).
	self assert: lexer next equals: (TokenName value: 'b').
	self assert: lexer next equals: (TokenSymbol rightParen).
	self assert: lexer next equals: (TokenSymbol leftCurly).
	self assert: lexer next equals: (TokenKeyword value: #return).
	self assert: lexer next equals: (TokenName value: 'a').
	self assert: lexer next equals: (TokenSymbol plus).
	self assert: lexer next equals: (TokenName value: 'b').
	self assert: lexer next equals: (TokenSymbol semiColon).
	self assert: lexer next equals: (TokenSymbol rightCurly).
	
	
	
]

{ #category : #tests }
LexerTest >> testLexMultiplication [
	| lexer |
	lexer := Lexer source: 'a * b'.
	self assert: lexer next equals: (TokenName value: 'a').
	self assert: lexer next equals: TokenSymbol multiply.
	self assert: lexer next equals: (TokenName value: 'b')
]

{ #category : #tests }
LexerTest >> testLexNameToTokenName [
	| lexer token |
	lexer := Lexer source: 'foobar'.
	token := lexer next.
	self assert: token equals: (TokenName value: 'foobar').
	self assert: token start equals: 1.
	self assert: token end equals: 6.
]

{ #category : #tests }
LexerTest >> testLexNumberToNumberToken [
	| lexer token |
	lexer := Lexer source: '42'.
	token := lexer next.
	self assert: token equals: (TokenNumber value: 42).
	self assert: token start equals: 1.
	self assert: token end equals: 2.
]

{ #category : #tests }
LexerTest >> testLexStatementToTokens [
	| lexer token |
	lexer := Lexer source: 'var foo = 42'.
	token := lexer next.
	self assert: token equals: (TokenKeyword value: #var).
	self assert: token start equals: 1.
	self assert: token end equals: 3.

	token := lexer next.
	self assert: token equals: (TokenName value: 'foo').
	self assert: token start equals: 5.
	self assert: token end equals: 7.
	
	token := lexer next.
	self assert: token equals: (TokenSymbol value: #=).
	self assert: token start equals: 9.
	self assert: token end equals: 9.
	
	token := lexer next.
	self assert: token equals: (TokenNumber value: 42).
	self assert: token start equals: 11.
	self assert: token end equals: 12.
	
]

{ #category : #tests }
LexerTest >> testLexStatementWithStringToTokens [
	| lexer token |
	lexer := Lexer source: 'var foo = "string"'.
	token := lexer next.
	self assert: token equals: (TokenKeyword value: #var).
	self assert: token start equals: 1.
	self assert: token end equals: 3.
	token := lexer next.
	self assert: token equals: (TokenName value: 'foo').
	self assert: token start equals: 5.
	self assert: token end equals: 7.
	token := lexer next.
	self assert: token equals: (TokenSymbol value: #=).
	self assert: token start equals: 9.
	self assert: token end equals: 9.
	token := lexer next.
	self assert: token equals: (TokenString value: '"string"').
	self assert: token start equals: 11.
	self assert: token end equals: 18
]

{ #category : #tests }
LexerTest >> testLexStringToStringToken [
	| lexer token |
	lexer := Lexer source: '"42"'.
	token := lexer next.
	self assert: token equals: (TokenString value: '"42"').
	self assert: token start equals: 1.
	self assert: token end equals: 4
]

{ #category : #tests }
LexerTest >> testLexVarToTokenKeyword [
	| lexer token |
	lexer := Lexer source: 'var'.
	token := lexer next.
	self assert: token equals: (TokenKeyword value: #var).
	self assert: token start equals: 1.
	self assert: token end equals: 3.
]

{ #category : #tests }
LexerTest >> testPrintingNumber [
	self assert: (TokenNumber value: 4) printString equals: 'TokenNumber (4)'
]
