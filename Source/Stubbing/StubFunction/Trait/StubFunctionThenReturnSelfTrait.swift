//
//  StubFunctionThenReturnSelfTrait.swift
//  Cuckoo
//
//  Created by Luckhardt, Charles on 8/14/19.
//

import Foundation

public protocol StubFunctionThenReturnSelfTrait: SelfRequirementStubFunctionTrait {
    /// Returns `output` when invoked.
    func thenReturnSelf() -> Self
}

public protocol StubFunctionThenReturnOptionalSelfTrait: SelfRequirementStubFunctionTrait {
    /// Returns `output` when invoked.
    func thenReturnOptionalSelf() -> Self
}

public extension StubFunctionThenReturnSelfTrait where OutputType == SelfType {
    @discardableResult
    func thenReturnSelf() -> Self {
        stub.appendAction(.returnValue(self.environment._self))
        return self
    }
}

public extension StubFunctionThenReturnOptionalSelfTrait where OutputType == Optional<SelfType> {
    @discardableResult
    func thenReturnOptionalSelf() -> Self {
        stub.appendAction(.returnValue(self.environment._self))
        return self
    }
}
