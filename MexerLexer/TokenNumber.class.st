Class {
	#name : #TokenNumber,
	#superclass : #MyToken,
	#category : #MexerLexer
}

{ #category : #'as yet unclassified' }
TokenNumber class >> start: anInteger [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
TokenNumber >> asStarter [
	^ self asConstant 
]

{ #category : #'as yet unclassified' }
TokenNumber >> given: aToken [
	^ aToken givenNumber: self
]

{ #category : #'as yet unclassified' }
TokenNumber >> givenAddition: anEAddition [
	^ self setRightSideOf: anEAddition.
]

{ #category : #'as yet unclassified' }
TokenNumber >> givenAssignment: anEAssignment [
	anEAssignment value
		ifNil: [ anEAssignment value: self ] 
		ifNotNil: [ anEAssignment value: (anEAssignment value given: self) ].
	^ anEAssignment
]

{ #category : #'as yet unclassified' }
TokenNumber >> givenDivision: anEDivision [ 
	^ self setRightSideOf: anEDivision.
]

{ #category : #'as yet unclassified' }
TokenNumber >> givenMultiplication: anEMultiplication [
	^ self setRightSideOf: anEMultiplication 
	
]

{ #category : #'as yet unclassified' }
TokenNumber >> givenObject: anEObject [ 
	anEObject put: self.
	^ anEObject 
]

{ #category : #'as yet unclassified' }
TokenNumber >> givenSubtraction: anESubtraction [
	^ self setRightSideOf: anESubtraction
]

{ #category : #'as yet unclassified' }
TokenNumber >> givenSymbol: aTokenSymbol [ 
	^ aTokenSymbol givenConstant: self asConstant 
]

{ #category : #initialization }
TokenNumber >> setRightSideOf: aBinaryExpression [
	aBinaryExpression right: self asConstant .
	^ aBinaryExpression
]
