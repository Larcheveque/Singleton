Trait {
	#name : #SGLTSingleton,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Singleton-Core'
}

{ #category : #accessing }
SGLTSingleton classSide >> new [
	SGLSingletonInstanciationException signal.
	^ super new
]

{ #category : #accessing }
SGLTSingleton classSide >> removeUniqueInstance [
	uniqueInstance := nil
]

{ #category : #accessing }
SGLTSingleton classSide >> uniqueInstance [
	SGLDirectSingletonAccessException signal.
	^ uniqueInstance
		ifNil: [ uniqueInstance := [ self new ]
				on: SGLSingletonInstanciationException
				do: #resume ]
]
