Class {
	#name : #EConstantTest,
	#superclass : #TestCase,
	#category : #'MexerExpressions-Tests'
}

{ #category : #tests }
EConstantTest >> testEvaluate [ 
	self assert: ((EConstant new value: 5) evaluateWith: Dictionary new)
	equals: 5.
]

{ #category : #tests }
EConstantTest >> testEvaluationWithCreationMessage [
	self assert: ((EConstant value: 5) evaluateWith: Dictionary new)
		equals: 5
]

{ #category : #tests }
EConstantTest >> testNegated [
	self assert: ((EConstant new value: 6) negated evaluateWith: Dictionary new)
	equals: -6
]

{ #category : #tests }
EConstantTest >> testPrinting [
	self assert: EConstant constant5 printString equals: 'TokenNumber (5)'
]
