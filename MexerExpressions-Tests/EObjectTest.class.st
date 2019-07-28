Class {
	#name : #EObjectTest,
	#superclass : #TestCase,
	#category : #'MexerExpressions-Tests'
}

{ #category : #tests }
EObjectTest >> testCreationWithMessage [
	| object |
	object := EObject empty.
	self assert: object expressions equals: OrderedDictionary new
]

{ #category : #tests }
EObjectTest >> testPrinting [
	| object |
	self assert: EObject empty printString equals: '{  }'.
	object := EObject empty.
	object at: (TokenName value: 'addition') put: EAddition fivePlusThree.
	self
		assert: object printString
		equals: '{ TokenName (addition): ( TokenNumber (5) + TokenNumber (3) ) }'
]

{ #category : #tests }
EObjectTest >> testPrintingMultipleKeys [
	| object |
	object := EObject empty.
	object at: (TokenName value: 'addition') put: EAddition fivePlusThree.
	object
		at: (TokenName value: 'subtraction')
		put: ESubtraction fiveMinusThree.
	self
		assert: object printString
		equals:
			'{ TokenName (addition): ( TokenNumber (5) + TokenNumber (3) ), TokenName (subtraction): ( TokenNumber (5) - TokenNumber (3) ) }'
]
