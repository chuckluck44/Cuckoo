//
//  StubSelfReturnFunction.swift
//  Cuckoo
//
//  Created by Luckhardt, Charles on 8/14/19.
//

import Foundation

public protocol StubSelfReturnFunction: StubFunctionThenTrait, StubFunctionThenReturnTrait, StubFunctionThenReturningSelfTrait {
}

public struct ProtocolStubSelfReturnFunction<SELF: ProtocolMock, IN, OUT>: StubSelfReturnFunction {
    public  let environment: ContainerEnvironment<SELF>
    public let stub: ConcreteStub<IN, OUT>

    public init(environment: ContainerEnvironment<SELF>, stub: ConcreteStub<IN, OUT>) {
        self.environment = environment
        self.stub = stub
    }
}

public struct ClassStubSelfReturnFunction<SELF: ClassMock, IN, OUT>: StubSelfReturnFunction, StubFunctionThenCallRealImplementationTrait  {
    public let environment: ContainerEnvironment<SELF>
    public let stub: ConcreteStub<IN, OUT>

    public init(environment: ContainerEnvironment<SELF>, stub: ClassConcreteStub<IN, OUT>) {
        self.environment = environment
        self.stub = stub
    }
}

extension ProtocolStubSelfReturnFunction: StubFunctionThenReturnSelfTrait where OUT == SELF {
}

extension ClassStubSelfReturnFunction: StubFunctionThenReturnSelfTrait where OUT == SELF {
}

extension ProtocolStubSelfReturnFunction: StubFunctionThenReturnOptionalSelfTrait where OUT == Optional<SELF> {
}

extension ClassStubSelfReturnFunction: StubFunctionThenReturnOptionalSelfTrait where OUT == Optional<SELF> {
}
