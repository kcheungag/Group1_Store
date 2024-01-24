//
//  Store.swift
//  group1_store
//
//  Created by Cheung K on 21/1/2024.
//  Work Distributed: Dayeeta

import Foundation


class Store {
    var items: [Item] = []

    func buyItem(customer: Customer, itemId: Int) {
        guard let itemToBuy = items.first(where: { $0.id == itemId }) else {
                    print("-------------------------\nError: Item not found in the store.\n-------------------------")
                    return
                }

        guard !customer.itemsList.contains(where: { $0.id == itemId }) else {
            print("-------------------------\nError: You already own a copy of this item.\n-------------------------")
            return
        }

        guard customer.balance >= itemToBuy.price else {
            print("-------------------------\nError: Insufficient funds to purchase the item.\n-------------------------")
            return
        }
        
        customer.balance -= itemToBuy.price
        let ownedItem = OwnedItem(item: itemToBuy)
        customer.addOwnedItem(ownedItem)
        print("-------------------------\nPurchase success!\n-------------------------")
        
        itemToBuy.printReceipt(isRefund: false, amount: itemToBuy.price)
    }

    func issueRefund(customer: Customer, itemId: Int) {
        guard let itemToRefund = customer.itemsList.first(where: { $0.id == itemId }) else {
                    print("-------------------------\nError: You don't own this item.\n-------------------------")
                    return
                }

        guard itemToRefund.minutesConsumed < 30 else {
            print("-------------------------\nError: Item cannot be refunded as it has been used for more than 30 minutes.\n-------------------------")
            return
        }

        customer.balance += itemToRefund.price
        customer.removeOwnedItem(itemToRefund)
        print("-------------------------\nRefund success!\n-------------------------")
        itemToRefund.printReceipt(isRefund: true, amount: itemToRefund.price)
    }

    func findByTitle(keyword: String) {
        var foundItems = false
        for item in items {
            if item.title.lowercased().contains(keyword.lowercased()) {
                foundItems = true
                print("-------------------------")
                if let game = item as? Game {
                    print("\(game.info)")
                } else if let movie = item as? Movie {
                    print("\(movie.info)")
                }
                print("-------------------------")
            }
        }

        if !foundItems {
            print("-------------------------\nSorry, no matching items found.\n-------------------------")
        }
    }
}
