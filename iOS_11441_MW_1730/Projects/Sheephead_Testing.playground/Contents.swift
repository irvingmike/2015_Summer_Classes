//: Playground - noun: a place where people can play

import Foundation


func dealCards(var deck: [String]) -> (p1: [String], p2: [String], p3: [String], p4: [String], p5: [String], blind: [String]) {
    var index: Int
    var (p1, p2, p3, p4, p5) = ([String](), [String](), [String](), [String](), [String]())
    while deck.count > 2 {
        index = Int(arc4random_uniform(UInt32(deck.count)))
        p1.append(deck[index])
        deck.removeAtIndex(index)
        index = Int(arc4random_uniform(UInt32(deck.count)))
        p2.append(deck[index])
        deck.removeAtIndex(index)
        index = Int(arc4random_uniform(UInt32(deck.count)))
        p3.append(deck[index])
        deck.removeAtIndex(index)
        index = Int(arc4random_uniform(UInt32(deck.count)))
        p4.append(deck[index])
        deck.removeAtIndex(index)
        index = Int(arc4random_uniform(UInt32(deck.count)))
        p5.append(deck[index])
        deck.removeAtIndex(index)
    }
    println(deck)
    println(p1)
    println(p2)
    println(p3)
    println(p4)
    println(p5)
    var blind = deck
    return (p1, p2, p3, p4, p5, blind)
}

let cardValues: [String: Int] = ["QC": 100, "QS": 99, "QH": 98, "QD": 97, "JC": 96, "JS": 95, "JH": 94, "JD": 93, "AD": 50, "0D": 49, "KD": 48, "9D": 47, "8D": 46, "7D": 45, "AC":6, "0C": 5, "KC": 4, "9C": 3, "8C": 2, "7C": 1, "AS":6, "0S": 5, "KS": 4, "9S": 3, "8S": 2, "7S": 1, "AH":6, "0H": 5, "KH": 4, "9H": 3, "8H": 2, "7H": 1]

var deck = ["QC", "QS", "QH", "QD", "JC", "JS", "JH", "JD", "AD", "0D", "KD", "9D", "8D", "7D", "AC", "0C", "KC", "9C", "8C", "7C", "AS", "0S", "KS", "9S", "8S", "7S", "AH", "0H", "KH", "9H", "8H", "7H"]
var p1 = [String]()
var p1Taken = [String]()
var p2 = [String]()
var p2Taken = [String]()
var p3 = [String]()
var p3Taken = [String]()
var p4 = [String]()
var p4Taken = [String]()
var p5 = [String]()
var p5Taken = [String]()
var blind = [String]()

var returned = dealCards(deck)
p1 = returned.p1
p2 = returned.p2
p3 = returned.p3
p4 = returned.p4
p5 = returned.p5
blind = returned.blind

