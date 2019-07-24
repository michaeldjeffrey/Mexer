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
	anEAddition right: self asConstant.
	^ anEAddition 
]

{ #category : #'as yet unclassified' }
TokenNumber >> givenMultiplication: anEMultiplication [ 
	anEMultiplication right: self asConstant.
	^ anEMultiplication 
]
