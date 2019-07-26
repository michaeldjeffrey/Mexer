Class {
	#name : #EMultiplication,
	#superclass : #EBinaryExpression,
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EMultiplication class >> fiveTimesThree [
	<sampleInstance>
	^ self new
		left: EConstant constant5;
		right: EConstant constant3;
		yourself
]

{ #category : #'as yet unclassified' }
EMultiplication >> evaluateWith: aCollection [ 
	^ (left evaluateWith: aCollection) * (right evaluateWith: aCollection)
]

{ #category : #'as yet unclassified' }
EMultiplication >> given: aTokenNumber [ 
	^ aTokenNumber givenMultiplication: self
]

{ #category : #accessing }
EMultiplication >> operatorString [
	^ ' * '
]
