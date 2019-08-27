//
//  BaseStubFunctionTrait.swift
//  Cuckoo
//
//  Created by Filip Dolnik on 27.06.16.
//  Copyright © 2016 Brightify. All rights reserved.
//

public protocol BaseStubFunctionTrait {
    associatedtype InputType
    associatedtype OutputType
    
    var stub: ConcreteStub<InputType, OutputType> { get }
}

public struct ContainerEnvironment<SELF: Mock> {
    public unowned var _self: SELF!
}

public protocol SelfRequirementStubFunctionTrait: BaseStubFunctionTrait {
    associatedtype SelfType: Mock

    var environment: ContainerEnvironment<SelfType> { get }
}

