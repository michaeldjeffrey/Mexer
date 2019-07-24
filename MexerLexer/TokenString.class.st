Class {
	#name : #TokenString,
	#superclass : #MyToken,
	#category : #'MexerLexer-Tokens'
}

{ #category : #printing }
TokenString >> printInsideOn: aStream [
	aStream << value asString
]
