"
I am an exception raised when you try to directly access a singleton.

You should not access a singleton from everywhere (it creates lots of dependencies) but instead apply the same patterns you use to access regular instances (give it as method argument, store it in a configuration object...).

At the place (unique) you access it, you can resume the exception to obtain the singleton instance:
[ SGLTestSingleton uniqueInstance ]
		on: SGLDirectSingletonAccessException
		do: #resume
"
Class {
	#name : #SGLDirectSingletonAccessException,
	#superclass : #Exception,
	#category : #'Singleton-Core'
}

{ #category : #accessing }
SGLDirectSingletonAccessException >> defaultAction [
	self class comment inspect.
	UnhandledError signalForException: self
]
