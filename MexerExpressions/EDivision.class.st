Class {
	#name : #EDivision,
	#superclass : #EBinaryExpression,
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EDivision class >> fiveDividedByThree [
	<sampleInstance>
	| five three |
	five := EConstant constant5.
	three := EConstant constant3.
	^ self left: five right: three.
]

{ #category : #'as yet unclassified' }
EDivision >> given: aTokenNumber [ 
	^ aTokenNumber givenDivision: self
]

{ #category : #accessing }
EDivision >> operatorString [
	^ ' / '
]
