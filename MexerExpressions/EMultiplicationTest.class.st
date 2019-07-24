Class {
	#name : #EMultiplicationTest,
	#superclass : #TestCase,
	#category : #MexerExpressions
}

{ #category : #tests }
EMultiplicationTest >> testEvaluate [
	| five three |
	five := EConstant constant5.
	three := EConstant constant3.
	self
		assert:
			(EMultiplication new
				left: five;
				right: three;
				evaluateWith: Dictionary new)
				equals: 15
]

{ #category : #tests }
EMultiplicationTest >> testNegated [
	| five three |
	five := EConstant constant5.
	three := EConstant constant3.
	self
		assert:
			(EMultiplication new
				left: five;
				right: three;
				evaluateWith: Dictionary new) negated
		equals: -15
]

{ #category : #tests }
EMultiplicationTest >> testPrinting [
	self assert: EMultiplication fiveTimesThree printString equals: '( 5 * 3 )'.
	self assert: EMultiplication fiveTimesThree negated printString equals: '- ( 5 * 3 )'
]
