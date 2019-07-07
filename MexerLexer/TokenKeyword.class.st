Class {
	#name : #TokenKeyword,
	#superclass : #MyToken,
	#category : #MexerLexer
}

{ #category : #accessing }
TokenKeyword class >> keywords [ 	
	^ #('var' 'function' 'return')
]

{ #category : #accessing }
TokenKeyword >> value: aString [
	value := aString asSymbol 
]
