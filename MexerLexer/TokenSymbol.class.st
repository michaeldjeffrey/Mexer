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
	^ #('=' '+' '(' ')' ',' ';' '{' '}' '[' ']')
]
