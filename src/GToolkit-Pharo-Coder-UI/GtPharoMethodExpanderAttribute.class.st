Class {
	#name : #GtPharoMethodExpanderAttribute,
	#superclass : #BrGlamorousTriangleExpanderTextAttribute,
	#instVars : [
		'classOrMetaClass',
		'selector'
	],
	#category : #'GToolkit-Pharo-Coder-UI-Attributes'
}

{ #category : #'instance creation' }
GtPharoMethodExpanderAttribute class >> forClass: aClass andSelector: aSymbol [
	^ self new
		forClass: aClass andSelector: aSymbol;
		yourself
]

{ #category : #private }
GtPharoMethodExpanderAttribute >> buildMethodCoder [
	| editorElement coder method |
	(method := self compiledMethod)
		ifNil: [ ^ BlElement new ].
	coder := GtPharoMethodCoder forMethod: method.
	coder subscribeToSystem.
	editorElement := coder asElement.
	editorElement
		margin:
			(BlInsets
				top: 3
				right: 10
				bottom: 10
				left: 10).
	^ editorElement
]

{ #category : #accessing }
GtPharoMethodExpanderAttribute >> classOrMetaClass [
	^ classOrMetaClass
]

{ #category : #accessing }
GtPharoMethodExpanderAttribute >> compiledMethod [
	^ classOrMetaClass lookupSelector: selector
]

{ #category : #'initialize-release' }
GtPharoMethodExpanderAttribute >> forClass: aClass andSelector: aSymbol [
	classOrMetaClass := aClass.
	selector := aSymbol
]

{ #category : #'initialize-release' }
GtPharoMethodExpanderAttribute >> initialize [
	super initialize.
	self
		attributesCreatingBlock: [ BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ self buildMethodCoder ] ]
]

{ #category : #accessing }
GtPharoMethodExpanderAttribute >> selector [
	^ selector
]
