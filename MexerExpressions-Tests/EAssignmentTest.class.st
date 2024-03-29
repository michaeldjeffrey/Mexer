Class {
	#name : #EAssignmentTest,
	#superclass : #TestCase,
	#category : #'MexerExpressions-Tests'
}

{ #category : #tests }
EAssignmentTest >> testPrinting [
	"I'm not minding the class names right now. Just trying to see what's happening while debugging."

	| assignment |
	assignment := EAssignment new
		type: (TokenSymbol value: 'var');
		id: (TokenName value: 'name');
		value: EConstant fourtyTwo.
	self
		assert: assignment printString
		equals: 'TokenSymbol (var) TokenName (name) = TokenNumber (42)'
]

{ #category : #tests }
EAssignmentTest >> testRightHandAddition [
	| assignment five three |
	five := EConstant constant5.
	three := EConstant constant3.
	assignment := EAssignment new value: five.
	assignment given: TokenSymbol plus.
	self assert: assignment value equals: (EAddition new left: EConstant constant5 ).
	assignment given: three.
	self assert: assignment value equals: EAddition fivePlusThree
]
