Class {
	#name : #EFunction,
	#superclass : #EExpression,
	#instVars : [
		'name',
		'expressions',
		'argumentList',
		'declaration'
	],
	#category : #MexerExpressions
}

{ #category : #'as yet unclassified' }
EFunction class >> anonymous [
	^ EAnonymousFunction new
]

{ #category : #'instance creation' }
EFunction class >> named: aTokenName [
	^ ENamedFunction new
		name: aTokenName;
		yourself
]

{ #category : #'as yet unclassified' }
EFunction >> addArgument: aTokenName [ 
	argumentList add: aTokenName 
]

{ #category : #adding }
EFunction >> addExpression: anEExpression [
	expressions add: anEExpression 
]

{ #category : #'as yet unclassified' }
EFunction >> expressions [
	^ expressions
]

{ #category : #'as yet unclassified' }
EFunction >> fromDeclaration: aTokenKeyword [ 
	declaration := aTokenKeyword 
]

{ #category : #initialization }
EFunction >> initialize [
	super initialize.
	argumentList := EArgumentList new declaration: self; yourself.
	expressions := EFunctionBody new
		declaration: self;
		yourself
]

{ #category : #testing }
EFunction >> isAnonymous [
	self subclassResponsibility 
]

{ #category : #accessing }
EFunction >> name [
	self subclassResponsibility 
]

{ #category : #testing }
EFunction >> name: aTokenName [
	name := aTokenName
]

{ #category : #printing }
EFunction >> printOn: aStream [
	aStream
		nextPutAll: 'function';
		space;
		nextPutAll: self name;
		space;
		print: argumentList;
		space;
		print: expressions 
]
