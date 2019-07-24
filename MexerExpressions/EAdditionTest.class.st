Class {
	#name : #EAdditionTest,
	#superclass : #TestCase,
	#category : #MexerExpressions
}

{ #category : #tests }
EAdditionTest >> testEqual [
	| ep1 ep2 |
	ep1 := EConstant constant5.
	ep2 := EConstant constant3.
	self
		assert:
			(EAddition left: ep1 right: ep2) 
		equals: (EAddition left: ep1 right: ep2)
]

{ #category : #tests }
EAdditionTest >> testEvalatuationWithCreationMessage [
	self assert: (EAddition fivePlusThree evaluateWith: Dictionary new)
		equals: 8
]

{ #category : #tests }
EAdditionTest >> testEvaluate [
	| ep1 ep2 |
	ep1 := EConstant constant5.
	ep2 := EConstant constant3.
	self assert: ((EAddition left: ep1 right: ep2) evaluateWith: Dictionary new)
	equals: 8
]

{ #category : #tests }
EAdditionTest >> testEvaluateWithNegation [
	| ep1 ep2 |
	ep1 := EConstant constant5 negated.
	ep2 := EConstant constant3.
	self
		assert: ((EAddition left: ep1 right: ep2) evaluateWith: Dictionary new)
		equals: -2
]

{ #category : #tests }
EAdditionTest >> testNegated [
	| ep1 ep2 |
	ep1 := EConstant constant5.
	ep2 := EConstant constant3.
	self
		assert: ((EAddition left: ep1 right: ep2) negated evaluateWith: Dictionary new)
		equals: -8
]

{ #category : #tests }
EAdditionTest >> testPrinting [
	self assert: EAddition fivePlusThree printString equals: '( 5 + 3 )'.
	self assert: EAddition fivePlusThree negated printString equals: '- ( 5 + 3 )'.
]
