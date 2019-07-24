Class {
	#name : #TokenSymbol,
	#superclass : #MyToken,
	#category : #MexerLexer
}

{ #category : #'as yet unclassified' }
TokenSymbol class >> comma [
	^ self new value: ','
]

{ #category : #'as yet unclassified' }
TokenSymbol class >> leftCurly [
	^ self new value: '{'
]

{ #category : #'as yet unclassified' }
TokenSymbol class >> leftParen [
	^ self new value: '('
]

{ #category : #'as yet unclassified' }
TokenSymbol class >> leftSquare [
	^ self new value: '['
]

{ #category : #modes }
TokenSymbol class >> multiply [
	^ self new value: '*'
]

{ #category : #'as yet unclassified' }
TokenSymbol class >> plus [
	^ self new value: '+'
]

{ #category : #'as yet unclassified' }
TokenSymbol class >> rightCurly [
	^ self new value: '}'
]

{ #category : #'as yet unclassified' }
TokenSymbol class >> rightParen [
	^ self new value: ')'
]

{ #category : #'as yet unclassified' }
TokenSymbol class >> rightSquare [
	^ self new value: ']'
]

{ #category : #'as yet unclassified' }
TokenSymbol class >> semiColon [
	^ self new value: ';'
]

{ #category : #'as yet unclassified' }
TokenSymbol class >> symbols [
	^ #('=' '+' '*' '(' ')' ',' ';' '{' '}' '[' ']')
]

{ #category : #'as yet unclassified' }
TokenSymbol >> classForSymbol [
	self isAddition ifTrue: [ ^ EAddition  ].
	^ EMultiplication
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenAddition: anEAddition [
	^ self givenExpression: anEAddition 
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenConstant: anEConstant [
	^ self givenExpression: anEConstant 
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenExpression: anExpression [
	^ self classForSymbol new
		left: anExpression;
		yourself
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenMultiplication: anEMultiplication [
	^ self givenExpression: anEMultiplication.
]

{ #category : #testing }
TokenSymbol >> isAddition [
	^ value = '+'
]
