Class {
	#name : #BaselineOfSingleton,
	#superclass : #BaselineOf,
	#category : #BaselineOfSingleton
}

{ #category : #baselines }
BaselineOfSingleton >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'Singleton-Core'.
			spec
				package: 'Singleton-Test'
				with: [ spec requires: 'Singleton-Core' ] ]
]
