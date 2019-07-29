Class {
	#name : #EFunctionBody,
	#superclass : #EExpression,
	#instVars : [
		'declaration',
		'terminatedExpressions',
		'currentExpression'
	],
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EFunctionBody >> add: anEAddition [
	terminatedExpressions add: anEAddition
]

{ #category : #'as yet unclassified' }
EFunctionBody >> currentExpression: anEAddition [ 
	currentExpression := anEAddition
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
EFunctionBody >> giveToInner: aToken [
	currentExpression := currentExpression given: aToken.
]

{ #category : #'as yet unclassified' }
EFunctionBody >> given: aToken [
	aToken isRightCurly
		ifTrue: [ ^ declaration ].
	currentExpression ifNil: [ currentExpression := aToken asStarter ] ifNotNil: [ aToken givenFunctionBody: self ].
	
]

{ #category : #initialization }
EFunctionBody >> initialize [
	super initialize.
	currentExpression := nil.
	terminatedExpressions := OrderedCollection new
]

{ #category : #printing }
EFunctionBody >> printOn: aStream [
	aStream nextPutAll: '{'.
	terminatedExpressions isEmpty
		ifFalse: [ aStream crlf ].
	terminatedExpressions
		do: [ :expr | 
			aStream
				tab;
				print: expr;
				nextPutAll: ';';
				crlf ].
	currentExpression ifNotNil: [ aStream print: currentExpression  ].
	aStream nextPutAll: '}'
]

{ #category : #accessing }
EFunctionBody >> size [
	^ terminatedExpressions size + (currentExpression ifNil: [ 0 ] ifNotNil: [ 1 ])
]

{ #category : #'as yet unclassified' }
EFunctionBody >> terminateExpression [
	terminatedExpressions add: currentExpression.
	currentExpression := nil
]
