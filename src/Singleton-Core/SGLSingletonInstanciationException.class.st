"
I am an exception raised when you try to instantiate a singleton class.

By definition, you should not instantiate more than one singleton and it should be the one that is stored in the class-side attribute.

If you want to instantiate another instance (in a test case for example), you can resume the exception:
[ SGLTestSingleton new ]
		on: SGLSingletonInstanciationException
		do: #resume
"
Class {
	#name : #SGLSingletonInstanciationException,
	#superclass : #Exception,
	#category : #'Singleton-Core'
}

{ #category : #accessing }
SGLSingletonInstanciationException >> defaultAction [
	self class comment inspect.
	UnhandledError signalForException: self.
	
]
