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
	value = #function ifTrue: [ ^ EFunction anonymous fromDeclaration: self; yourself ].
	^ EAssignment new type: self
]

{ #category : #accessing }
TokenKeyword >> value: aString [
	value := aString asSymbol 
]
