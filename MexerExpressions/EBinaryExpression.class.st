Class {
	#name : #EBinaryExpression,
	#superclass : #EExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EBinaryExpression class >> left: anExpression right: anExpression2 [
	^ self new left: anExpression; right: anExpression2; yourself
]

{ #category : #accessing }
EBinaryExpression >> left: anExpression [
	left := anExpression
]

{ #category : #accessing }
EBinaryExpression >> operatorString [
	self subclassResponsibility 
]

{ #category : #accessing }
EBinaryExpression >> printOn: aStream [
	aStream 
		nextPutAll: '( ';
		print: left;
		nextPutAll: self operatorString;
		print: right;
		nextPutAll: ' )'.
]

{ #category : #accessing }
EBinaryExpression >> right: anExpression [
	right := anExpression 
]
