Class {
	#name : #EVariableTest,
	#superclass : #TestCase,
	#category : #'MexerExpressions-Tests'
}

{ #category : #tests }
EVariableTest >> testEvaluateXplusY [
	| one two add |
	one := EVariable id: #x.
	two := EVariable id: #y.
	add := EAddition left: one right: two.
	self
		assert:
			(add
				evaluateWith:
					{(#x -> 10).
					(#y -> 2)} asDictionary)
		equals: 12.
	self assert: (add evaluateWith: { #x -> 10 . #y -> 12 } asDictionary ) equals: 22.
]

{ #category : #tests }
EVariableTest >> testPrinting [ 
	self assert: (EVariable id: #x) printString equals: 'x'
]

{ #category : #tests }
EVariableTest >> testValueOfX [
	self assert: ((EVariable id: #x) evaluateWith: { #x -> 10 } asDictionary) equals: 10
]

{ #category : #tests }
EVariableTest >> testValueOfXInNegation [
	self
		assert: ((EVariable id: #x) negated evaluateWith: {(#x -> 10)} asDictionary)
		equals: -10
]
