//
//  StubFunctionThenReturningSelfTrait.swift
//  Cuckoo
//
//  Created by Luckhardt, Charles on 8/14/19.
//

import Foundation

public protocol StubFunctionThenReturningSelfTrait: SelfRequirementStubFunctionTrait {
    func thenReturningSelf(_ implementation: @escaping (ContainerEnvironment<SelfType>, InputType) -> OutputType) -> Self
}

public extension StubFunctionThenReturningSelfTrait {
    @discardableResult
    func thenReturningSelf(_ implementation: @escaping (ContainerEnvironment<SelfType>, InputType) -> OutputType) -> Self {
        stub.appendAction(.callImplementation({ implementation(self.environment, $0) }))
        return self
    }
}
