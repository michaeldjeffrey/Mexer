Class {
	#name : #EFunctionBody,
	#superclass : #EExpression,
	#instVars : [
		'expressions',
		'declaration'
	],
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EFunctionBody >> add: anEAddition [ 
	expressions add: anEAddition 
]

{ #category : #'as yet unclassified' }
EFunctionBody >> declaration [
	^ declaration
]

{ #category : #accessing }
EFunctionBody >> declaration: anEFunction [
	declaration := anEFunction 
]

{ #category : #'as yet unclassified' }
EFunctionBody >> expressions [
	^ expressions
]

{ #category : #'as yet unclassified' }
EFunctionBody >> given: aTokenSymbol [ 
	^ aTokenSymbol givenFunctionBody: self
]

{ #category : #initialization }
EFunctionBody >> initialize [ 
	super initialize .
	expressions := OrderedCollection new.
]

{ #category : #printing }
EFunctionBody >> printOn: aStream [
	aStream nextPutAll: '{'.
	expressions isEmpty
		ifFalse: [ aStream crlf ].
	expressions
		do: [ :expr | 
			aStream
			tab;
				print: expr;
				nextPutAll: ';';
				crlf ].
	aStream nextPutAll: '}'
]
