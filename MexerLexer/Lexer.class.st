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
Lexer >> allTokens [
	| all |
	all := OrderedCollection new.
	[ self atEnd ] whileFalse: [ all add: self next ].
	^ all
]

{ #category : #accessing }
Lexer >> atEnd [
	^ self currentToken class = TokenEOL 
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
	^ source at: index ifAbsent: [ TokenEOL new ]
]

{ #category : #accessing }
Lexer >> incIndex [
	^ index := index + 1
]

{ #category : #initialization }
Lexer >> initialize [ 
	index := 1
]

{ #category : #accessing }
Lexer >> next [
	self atEnd ifTrue: [ ^ self ].
	[ self currentToken isSeparator ] whileTrue: [ self incIndex ].
	self currentToken isDigit ifTrue: [ ^ self parseNumberToken ].
	self currentToken isLetter ifTrue: [ ^ self parseKeywordOrNameToken ].
	self currentToken isDoubleQuote ifTrue: [ ^ self parseStringToken ].
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

{ #category : #'as yet unclassified' }
Lexer >> parseStringToken [
	| tokenStart thing value |
	tokenStart := index.
	self incIndex.
	thing := self 
		collectFromSource: [ self currentToken isDoubleQuote not ] 
		into: (OrderedCollection with: $").
	thing add: $".
	self incIndex.
	value := self valueFrom: thing.
	^ TokenString new value: value;
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
	value isEmpty ifTrue: [ EmptySymbolError signal: 'Symbol cannot be empty' ].
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
