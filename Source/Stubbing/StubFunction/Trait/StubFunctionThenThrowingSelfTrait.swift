//
//  StubFunctionThenThrowingSelfTrait.swift
//  Cuckoo
//
//  Created by Luckhardt, Charles on 8/14/19.
//

import Foundation

public protocol StubFunctionThenThrowingSelfTrait: SelfRequirementStubFunctionTrait {
    func thenReturningSelf(_ implementation: @escaping (ContainerEnvironment<SelfType>, InputType) throws -> OutputType) -> Self
}

public extension StubFunctionThenThrowingSelfTrait {
    @discardableResult
    func thenReturningSelf(_ implementation: @escaping (ContainerEnvironment<SelfType>, InputType) throws -> OutputType) -> Self {
        stub.appendAction(.callImplementation({ try implementation(self.environment, $0) }))
        return self
    }
}
