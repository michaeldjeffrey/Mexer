Class {
	#name : #TokenSymbol,
	#superclass : #MyToken,
	#category : #MexerLexer
}

{ #category : #'as yet unclassified' }
TokenSymbol class >> colon [
	^ self new value: ':'
]

{ #category : #'as yet unclassified' }
TokenSymbol class >> comma [
	^ self new value: ','
]

{ #category : #'as yet unclassified' }
TokenSymbol class >> divide [
	^ self new value: '/'
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

{ #category : #accessing }
TokenSymbol class >> minus [
	^ self new value: '-'
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
	^ #('=' '+' '*' '-' '/' '(' ')' ',' ';' '{' '}' '[' ']' ':')
]

{ #category : #'as yet unclassified' }
TokenSymbol >> asStarter [
	value first = ${
		ifTrue: [ ^ EObject empty ].
	UnhandledSymbolAsStarterError
		signal: 'Do not know how to start with' , value
]

{ #category : #'as yet unclassified' }
TokenSymbol >> classForSymbol [
	self isAddition
		ifTrue: [ ^ EAddition ].
	self isSubtraction
		ifTrue: [ ^ ESubtraction ].
	self isDivision 
	ifTrue: [ ^ EDivision  ].
	^ EMultiplication
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenAddition: anEAddition [
	^ self givenExpression: anEAddition 
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenArgumentList: anEArgumentList [ 
	"End of arguments"
	value = ')' ifTrue: [ ^ anEArgumentList declaration ].
	"More arguments, eat"
	value = ',' ifTrue: [ ^ anEArgumentList ].
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenAssignment: anEAssignment [
	"Assignments are expected to happen with = symbols. 
	We'll handle other symbols on the right hand side in the future."

	anEAssignment value
		ifNotNil: [ anEAssignment value: (anEAssignment value givenSymbol: self) ].
	^ anEAssignment
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenConstant: anEConstant [
	^ self givenExpression: anEConstant 
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenDivision: anEDivision [ 
	^ self givenExpression: anEDivision 
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenExpression: anExpression [
	^ self classForSymbol new
		left: anExpression;
		yourself
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenFunctionBody: anEFunctionBody [
	"End of body"

	value = '}'
		ifTrue: [ ^ anEFunctionBody declaration ].
	value = ';'
		ifTrue: [ ^ anEFunctionBody terminateExpression ].
	anEFunctionBody giveToInner: self.
	^ anEFunctionBody
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenMultiplication: anEMultiplication [
	^ self givenExpression: anEMultiplication.
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenNamedFunction: anENamedFunction [ 
	"No arguments"
	value = '()' ifTrue: [ ^ anENamedFunction ].
	"Start of argument list"
	value = '(' ifTrue: [ ^ anENamedFunction arguments ].
	"Start of body"
	value = '{' ifTrue: [ ^ anENamedFunction expressions ].
	"End of body"
	self shouldBeImplemented 
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenObject: anEObject [
	value = ':'
		ifTrue: [ ^ anEObject ].
	"Start of an object"
	value = '{'
		ifTrue: [ ^ EObject withParent: anEObject ].
	"End of an object"
	value = '}'
		ifTrue: [ ^ anEObject parent ].
	"End of pair, Should we do something here?"
	value = ','
		ifTrue: [ ^ anEObject ].
	"An Empty nested object."
	value = '{}'
		ifTrue: [ anEObject put: EObject empty.
			^ anEObject ].
	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
TokenSymbol >> givenSubtraction: anESubtraction [ 
	^ self givenExpression: anESubtraction 
]

{ #category : #testing }
TokenSymbol >> isAddition [
	^ value = '+'
]

{ #category : #testing }
TokenSymbol >> isDivision [
	^ value = '/'
]

{ #category : #testing }
TokenSymbol >> isRightCurly [
	^ value = '}'
]

{ #category : #testing }
TokenSymbol >> isSubtraction [
	^ value = '-'
]
