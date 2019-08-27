//
//  StubSelfThrowingFunction.swift
//  Cuckoo
//
//  Created by Luckhardt, Charles on 8/14/19.
//

import Foundation

public protocol StubSelfThrowingFunction: StubFunctionThenTrait, StubFunctionThenReturnTrait, StubFunctionThenThrowTrait, StubFunctionThenThrowingTrait, StubFunctionThenReturningSelfTrait, StubFunctionThenThrowingSelfTrait {
}

public struct ProtocolStubSelfThrowingFunction<SELF: ProtocolMock, IN, OUT>: StubSelfThrowingFunction {
    public let environment: ContainerEnvironment<SELF>
    public let stub: ConcreteStub<IN, OUT>

    public init(environment: ContainerEnvironment<SELF>, stub: ConcreteStub<IN, OUT>) {
        self.environment = environment
        self.stub = stub
    }
}

public struct ClassStubSelfThrowingFunction<SELF: ClassMock, IN, OUT>: StubSelfThrowingFunction, StubFunctionThenCallRealImplementationTrait {
    public let environment: ContainerEnvironment<SELF>
    public let stub: ConcreteStub<IN, OUT>

    public init(environment: ContainerEnvironment<SELF>, stub: ClassConcreteStub<IN, OUT>) {
        self.environment = environment
        self.stub = stub
    }
}

extension ProtocolStubSelfThrowingFunction: StubFunctionThenReturnSelfTrait where SELF == OUT {
}

extension ClassStubSelfThrowingFunction: StubFunctionThenReturnSelfTrait where SELF == OUT {
}
