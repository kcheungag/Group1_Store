//
//  IsPurchasable.swift
//  group1_store
//
//  Created by Cheung K on 21/1/2024.
//  Work Distributed: Kwan

import Foundation

protocol IsPurchasable {
    var info: String { get }

    func printReceipt(isRefund: Bool, amount: Double)
}
