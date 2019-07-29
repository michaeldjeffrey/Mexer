Class {
	#name : #ParserFunctionBodyTest,
	#superclass : #TestCase,
	#category : #'MexerLexer-Tests'
}

{ #category : #tests }
ParserFunctionBodyTest >> testBodyAddidtionBuildup [
	| body |
	body := EFunctionBody new.
	body given: (TokenNumber value: 5).
	self assert: body size equals: 1.
	body given: TokenSymbol plus.
	self assert: body size equals: 1.
	body given: (TokenNumber value: 3).
	self assert: body size equals: 1
]

{ #category : #tests }
ParserFunctionBodyTest >> testMultipleExpressions [
	| body |
	body := EFunctionBody new.
	body currentExpression: EAddition fivePlusThree.
	self assert: body size equals: 1.
	body given: TokenSymbol semiColon.
	self assert: body size equals: 1.
	body given: (TokenNumber value: 5).
	self assert: body size equals: 2
]

{ #category : #tests }
ParserFunctionBodyTest >> testRightCurlyReturnsDeclaration [
	| body parent |
	parent := EFunction anonymous.
	body := EFunctionBody new.
	body declaration: parent.
	self assert: (body given: TokenSymbol rightCurly) equals: parent.
]
