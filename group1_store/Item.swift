//
//  Item.swift
//  group1_store
//
//  Created by Cheung K on 21/1/2024.
//

import Foundation

// Item.swift
class Item: IsPurchasable {
    let id: Int
    let title: String
    let price: Double

    init(id: Int, title: String, price: Double) {
        self.id = id
        self.title = title
        self.price = price
    }
    
    var info: String {
        return "Item ID: \(id), Title: \(title), Price: $\(price)"
    }
    
    func printReceipt(isRefund: Bool, amount: Double) {
        print("-------------------------\nYOUR RECEIPT\n-------------------------")
        if isRefund {
            print("We are refunding the purchase of \(title), Refunded Amount: $\(amount)")
        } else {
            print("Thank you for purchasing \(title), Paid Amount: $\(amount)")
        }
    }
}

class OwnedItem: Item {
    var minutesConsumed: Int = 0

    init(item: Item, minutesConsumed: Int = 0) {
        super.init(id: item.id, title: item.title, price: item.price)
        self.minutesConsumed = minutesConsumed
    }
}

class Game: Item {
    let publisher: String
    let isMultiplayer: Bool
    
    init(id: Int, title: String, price: Double, publisher: String, isMultiplayer: Bool) {
        self.publisher = publisher
        self.isMultiplayer = isMultiplayer
        super.init(id: id, title: title, price: price)
    }

    override var info: String {
            return "[GAME] \(title) $\(price)\nPublisher: \(publisher)\nHas Multiplayer: \(isMultiplayer)"
    }
}

class Movie: Item {
    let runningTime: Int
    
    init(id: Int, title: String, price: Double, runningTime: Int) {
        self.runningTime = runningTime
        super.init(id: id, title: title, price: price)
    }
    
    override var info: String {
            return "[MOVIE] \(title) $\(price)\nLength: \(runningTime)"
        }
}
