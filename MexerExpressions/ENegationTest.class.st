Class {
	#name : #ENegationTest,
	#superclass : #TestCase,
	#category : #MexerExpressions
}

{ #category : #tests }
ENegationTest >> testEvaluate [
	self assert: ((ENegation new expression: (EConstant constant5)) evaluateWith: Dictionary new)
	equals: -5
]

{ #category : #tests }
ENegationTest >> testNegatedStructureIsCorrect [
	| exp |
	exp := EConstant constant5.
	self assert: exp negated class equals: ENegation.
	self assert: exp negated negated equals: exp.
]

{ #category : #tests }
ENegationTest >> testNegationNegated [
	self assert: (EConstant constant5 negated negated evaluateWith: Dictionary new) equals: 5 
]

{ #category : #tests }
ENegationTest >> testPrinting [
	self assert: EConstant constant5 negated printString equals: '- 5'
]
