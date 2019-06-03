"
Tests for singletons
"
Class {
	#name : #SGLSingletonTest,
	#superclass : #TestCase,
	#instVars : [
		'singleton'
	],
	#category : #'Singleton-Test'
}

{ #category : #tests }
SGLSingletonTest >> setUp [
	SGLTestSingleton removeUniqueInstance
]

{ #category : #tests }
SGLSingletonTest >> testAccessSingletonIsPossibleOnResume [
	self
		assert:
			([ SGLTestSingleton uniqueInstance ]
				on: SGLDirectSingletonAccessException
				do: #resume) class
		equals: SGLTestSingleton
]

{ #category : #tests }
SGLSingletonTest >> testAccessSingletonRaiseException [
	self
		should: [ SGLTestSingleton uniqueInstance ]
		raise: SGLDirectSingletonAccessException
]

{ #category : #tests }
SGLSingletonTest >> testSingletonInstanciationIsDifferentThanUniqueInstance [
	self
		deny:
			([ SGLTestSingleton new ]
				on: SGLSingletonInstanciationException
				do: #resume)
		equals: ([ SGLTestSingleton uniqueInstance ]
				on: SGLDirectSingletonAccessException
				do: #resume)
]

{ #category : #tests }
SGLSingletonTest >> testSingletonInstanciationIsResumable [
	[ SGLTestSingleton new ]
		on: SGLSingletonInstanciationException
		do: #resume
]

{ #category : #tests }
SGLSingletonTest >> testSingletonInstanciationRaiseException [
	self
		should: [ SGLTestSingleton new ]
		raise: SGLSingletonInstanciationException
]
