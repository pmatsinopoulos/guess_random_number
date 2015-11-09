//
//  main.swift
//  GuessRandomNumber
//
//  Created by Panayotis Matsinopoulos on 11/9/15.
//  Copyright © 2015 Panayotis Matsinopoulos. All rights reserved.
//

import Foundation

var randomNumber = 1
var userGuess = 1
var continueGuessing = true
var keepPlaying = true
var input = ""
var numberOfGuesses = 0

while (keepPlaying) {
  randomNumber = Int(arc4random_uniform(101)) // get a random number between 0 - 100
  while (continueGuessing) {
    print("Pick up a number between 0 and 100")
    input = NSString(data: NSFileHandle.fileHandleWithStandardInput().availableData, encoding: NSUTF8StringEncoding)! as String
    input = input.stringByReplacingOccurrencesOfString("\n", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
    userGuess = Int(input)!
    print("User Guess: \(userGuess)")
    numberOfGuesses++
    if (userGuess == randomNumber) {
      continueGuessing = false
      print("(\(numberOfGuesses)) Congrats!")
    }
    else if (userGuess < randomNumber) {
      print("(\(numberOfGuesses)) You have guessed too low")
    }
    else {
      print("(\(numberOfGuesses)) You have guessed too high")
    }
  }
  print("Play Again ? Y or N")
  input = NSString(data: NSFileHandle.fileHandleWithStandardInput().availableData, encoding: NSUTF8StringEncoding)! as String
  input = input.stringByReplacingOccurrencesOfString("\n", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
  if (input == "N" || input == "n") {
    keepPlaying = false
  }
  continueGuessing = true
  numberOfGuesses = 0
}

