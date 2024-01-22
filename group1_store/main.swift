//
//  main.swift
//  group1_store
//
//  Created by Cheung K on 21/1/2024.
//

import Foundation

// main.swift
let store = Store()

// Adding items to the store
let game1 = Game(id: 1, title: "Kingdom Rush Origins", price: 19.79, publisher: "Ironhide Game Studio", isMultiplayer: false)
let movie1 = Movie(id: 2, title: "Deliverance: The Making of Kingdom Come", price: 6.69, runningTime: 98)

store.items.append(game1)
store.items.append(movie1)

let giftCard = GiftCard()
let customer = Customer(id: 1, giftCard: giftCard)

// Reloading customer's account
customer.reloadAccount(amount: 50.0)

// Buying an item
store.buyItem(customer: customer, itemId: 1)

// Trying to buy the same item again (should fail)
store.buyItem(customer: customer, itemId: 1)

// Buying another item
store.buyItem(customer: customer, itemId: 2)

// Using an owned item
customer.useItem(id: 1, numMinutes: 45)

// Issuing a refund for the used item (should fail)
store.issueRefund(customer: customer, itemId: 1)

// Using the movie
customer.useItem(id: 2, numMinutes: 25)

// Issuing a refund for the movie (should succeed)
store.issueRefund(customer: customer, itemId: 2)

// Searching for items by title
store.findByTitle(keyword: "Kingdom")

// Searching for non-existing items
store.findByTitle(keyword: "Nonexistent")

// Output customer's balance after interactions
print("Customer's Balance: $\(customer.balance)")



