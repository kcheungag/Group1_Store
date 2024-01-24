//
//  Customer.swift
//  group1_store
//
//  Created by Cheung K on 21/1/2024.
//  Work Distributed: MJ

import Foundation

class Customer {
    let id: Int
    var itemsList: [OwnedItem] = []
    var balance: Double = 10.0
    let giftCard: GiftCard
    
    init(id: Int, giftCard: GiftCard) {
        self.id = id
        self.giftCard = giftCard
    }
   
    func reloadAccount(amount: Double) {
       balance += amount
       print("-------------------------\nAccount reloaded. New balance: $\(balance)\n-------------------------")
    }


    func useItem(id: Int, numMinutes: Int) {
           if let item = itemsList.first(where: { $0.id == id }) {
               item.minutesConsumed += numMinutes
               print("-------------------------\nUsed \(numMinutes) minutes of \(item.title).\n-------------------------")
           } else {
               print("-------------------------\nError: Item with ID \(id) not found in the customer's owned items.\n-------------------------")
           }
    }
    
    func addOwnedItem(_ item: OwnedItem) {
            itemsList.append(item)
            print("-------------------------\nAdded \(item.title) to the list of owned items.\n-------------------------")
    }
    
    func removeOwnedItem(_ item: OwnedItem) {
            if let index = itemsList.firstIndex(where: { $0.id == item.id }) {
                itemsList.remove(at: index)
                print("-------------------------\nRemoved \(item.title) from the list of owned items.\n-------------------------")
            } else {
                print("-------------------------\nError: Item not found in the list of owned items.\n-------------------------")
            }
    }
}
