Class {
	#name : #EBinaryExpression,
	#superclass : #EExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #MexerExpressions
}

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
