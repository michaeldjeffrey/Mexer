Class {
	#name : #TokenString,
	#superclass : #MyToken,
	#category : #'MexerLexer-Tokens'
}

{ #category : #converting }
TokenString >> asStarter [
	^ self asConstant 
]

{ #category : #'as yet unclassified' }
TokenString >> givenAssignment: anEAssignment [ 
	anEAssignment value: self asConstant .
	^ anEAssignment 
]

{ #category : #'as yet unclassified' }
TokenString >> givenObject: anEObject [
	anEObject put: self.
	^ anEObject 
]

{ #category : #printing }
TokenString >> printInsideOn: aStream [
	aStream << value asString
]
