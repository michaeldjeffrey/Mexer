Class {
	#name : #ESubtraction,
	#superclass : #EBinaryExpression,
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
ESubtraction class >> fiveMinusThree [
	<sampleInstance>
	| five three |
	five := EConstant constant5.
	three := EConstant constant3.
	^ self left: five right: three
]

{ #category : #printing }
ESubtraction >> evaluateWith: aDictionary [
	^ (left evaluateWith: aDictionary ) - (right evaluateWith: aDictionary )
]

{ #category : #'as yet unclassified' }
ESubtraction >> given: aToken [
	^ aToken givenSubtraction: self
]

{ #category : #accessing }
ESubtraction >> operatorString [
	^ ' - '
]
