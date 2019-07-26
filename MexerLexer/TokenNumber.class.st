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
TokenNumber >> givenAddition: anEAddition [
	^ self setRightSideOf: anEAddition.
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
TokenNumber >> givenSubtraction: anESubtraction [
	^ self setRightSideOf: anESubtraction
]

{ #category : #initialization }
TokenNumber >> setRightSideOf: aBinaryExpression [
	aBinaryExpression right: self asConstant .
	^ aBinaryExpression
]
