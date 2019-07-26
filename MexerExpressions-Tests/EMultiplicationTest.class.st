Class {
	#name : #EMultiplicationTest,
	#superclass : #TestCase,
	#category : #'MexerExpressions-Tests'
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
	self
		assert: EMultiplication fiveTimesThree printString
		equals: '( TokenNumber (5) * TokenNumber (3) )'.
	self
		assert: EMultiplication fiveTimesThree negated printString
		equals: '- ( TokenNumber (5) * TokenNumber (3) )'
]
