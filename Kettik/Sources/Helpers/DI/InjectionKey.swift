//
//  JSONHelper.swift
//  Kettik
//
//  Created by Tami on 10.04.2022.
//

import Foundation

public protocol InjectionKey {

    /// The associated type representing the type of the dependency injection key's value.
    associatedtype Value

    /// The default value for the dependency injection key.
    static var currentValue: Self.Value { get set }
}
