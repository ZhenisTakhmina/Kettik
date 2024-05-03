//
//  KTViewModelProtocol.swift
//  Kettik
//
//  Created by Tami on 01.05.2024.
//

import Foundation

protocol KTViewModelProtocol {
    
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

