Class {
	#name : #EExpression,
	#superclass : #Object,
	#category : #MexerExpressions
}

{ #category : #comparing }
EExpression >> = anExpression [
	^ self printString = anExpression printString
]

{ #category : #'as yet unclassified' }
EExpression >> negated [
	^ ENegation new expression: self
]
