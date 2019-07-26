Class {
	#name : #TokenKeyword,
	#superclass : #MyToken,
	#category : #MexerLexer
}

{ #category : #accessing }
TokenKeyword class >> keywords [
	^ #('var' 'const' 'let' 'function' 'return')
]

{ #category : #converting }
TokenKeyword >> asStarter [
	^ EAssignment new type: self
]

{ #category : #accessing }
TokenKeyword >> value: aString [
	value := aString asSymbol 
]
