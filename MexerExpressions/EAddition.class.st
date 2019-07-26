Class {
	#name : #EAddition,
	#superclass : #EBinaryExpression,
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EAddition class >> fivePlusThree [
	<sampleInstance>
	| five three |
	five := EConstant constant5.
	three := EConstant constant3.
	^ self left: five right: three
]

{ #category : #'as yet unclassified' }
EAddition >> evaluateWith: anObject [
	^ (left evaluateWith: anObject) + (right evaluateWith: anObject)
]

{ #category : #'as yet unclassified' }
EAddition >> given: aTokenNumber [
	^ aTokenNumber givenAddition: self
]

{ #category : #'as yet unclassified' }
EAddition >> operatorString [
	^ ' + '
]
