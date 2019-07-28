Class {
	#name : #EFunctionBodyTest,
	#superclass : #TestCase,
	#category : #'MexerExpressions-Tests'
}

{ #category : #tests }
EFunctionBodyTest >> testAddExpression [
	| body |
	body := EFunctionBody new.
	body add: EAddition fivePlusThree.
	self assert: body expressions size equals: 1
]

{ #category : #tests }
EFunctionBodyTest >> testCreation [ 
	| body |
	body := EFunctionBody new.
	self assert: body expressions equals: OrderedCollection new.
]

{ #category : #tests }
EFunctionBodyTest >> testPrintingEmpty [
	| body |
	body := EFunctionBody new.
	self assert: body printString equals: '{}'
]

{ #category : #tests }
EFunctionBodyTest >> testPrintingMultipleExpression [
	"Multiple expressions are separated by semicolons"

	| body |
	body := EFunctionBody new.
	body add: EAddition fivePlusThree.
	body add: EAddition fivePlusThree.
	self
		assert: body printString
		equals:
			(String crlf
				join:
					#('{' '	( TokenNumber (5) + TokenNumber (3) );' '	( TokenNumber (5) + TokenNumber (3) );' '}'))
]

{ #category : #tests }
EFunctionBodyTest >> testPrintingSingleExpression [
	| body |
	body := EFunctionBody new.
	body add: EAddition fivePlusThree.
	self
		assert: body printString
		equals:
			(String crlf join: #('{' '	( TokenNumber (5) + TokenNumber (3) );' '}'))
]
