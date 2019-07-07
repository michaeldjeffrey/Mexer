Class {
	#name : #Lexer,
	#superclass : #Object,
	#instVars : [
		'source',
		'index'
	],
	#category : #MexerLexer
}

{ #category : #accessing }
Lexer class >> source: aString [
	^ self new source: aString
]

{ #category : #'as yet unclassified' }
Lexer >> collectFromSource: aPredicateBlock into: aCollection [
	[ aPredicateBlock value ]
		whileTrue: [ 
			aCollection add: self currentToken.
			index := index + 1.
		].
	^ aCollection
]

{ #category : #'as yet unclassified' }
Lexer >> currentToken [
	^ source at: index ifAbsent: [ false ]
]

{ #category : #initialization }
Lexer >> initialize [ 
	index := 1
]

{ #category : #accessing }
Lexer >> next [
	[ self currentToken isSeparator ] whileTrue: [ index := index + 1 ].
	self currentToken isDigit ifTrue: [ ^ self parseNumberToken ].
	self currentToken isLetter ifTrue: [ ^ self parseKeywordOrNameToken ].
	^ self parseSymbolToken.

]

{ #category : #accessing }
Lexer >> parseKeywordOrNameToken [
	| thing tokenStart value |
	tokenStart := index.
	thing := self 
		collectFromSource: [ self currentToken isAlphaNumeric ] 
		into: OrderedCollection new.
	value := self valueFrom: thing.
	^ (self subclassFor: value) new
		value: value;
		start: tokenStart;
		end: tokenStart + value size - 1
]

{ #category : #accessing }
Lexer >> parseNumberToken [
	| thing tokenStart value |
	tokenStart := index.
	thing := self 
		collectFromSource: [ self currentToken isDigit ] 
		into: OrderedCollection new.
	value := self valueFrom: thing.
	^ TokenNumber new value: value asNumber;
	start: tokenStart;
	end: tokenStart + thing size - 1.
]

{ #category : #accessing }
Lexer >> parseSymbolToken [
	| thing tokenStart value |
	tokenStart := index.
	thing := self 
		collectFromSource: [ TokenSymbol symbols includes: self currentToken asString ]
		into: OrderedCollection new.
	value := self valueFrom: thing.
	value size = 0 ifTrue: [ NotFoundError signal: 'Symbol cannot be empty' ].
	^ TokenSymbol new value: value;
		start: tokenStart;
		end: tokenStart + thing size - 1.
]

{ #category : #accessing }
Lexer >> source [
	^ source
]

{ #category : #accessing }
Lexer >> source: anObject [
	source := anObject
]

{ #category : #'as yet unclassified' }
Lexer >> subclassFor: aValue [
	^ (TokenKeyword keywords includes: aValue)
		ifTrue: [ TokenKeyword ]
		ifFalse: [ TokenName ]
]

{ #category : #accessing }
Lexer >> valueFrom: aCollection [
	^ aCollection inject: '' into: [ :acc :each | acc , each asString ]
]
