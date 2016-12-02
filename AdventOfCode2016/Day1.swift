//
//  Day1.swift
//  AdventOfCode2016
//
//  Created by Techniexe on 02/12/16.
//  Copyright © 2016 Ekantik Tech. All rights reserved.
//

import Foundation

/**
--- Day 1: No Time for a Taxicab ---
 
 Santa's sleigh uses a very high-precision clock to guide its movements, and the clock's oscillator is regulated by stars. Unfortunately, the stars have been stolen... by the Easter Bunny. To save Christmas, Santa needs you to retrieve all fifty stars by December 25th.
 
 Collect stars by solving puzzles. Two puzzles will be made available on each day in the advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!
 
 You're airdropped near Easter Bunny Headquarters in a city somewhere. "Near", unfortunately, is as close as you can get - the instructions on the Easter Bunny Recruiting Document the Elves intercepted start here, and nobody had time to work them out further.
 
 The Document indicates that you should start at the given coordinates (where you just landed) and face North. Then, follow the provided sequence: either turn left (L) or right (R) 90 degrees, then walk forward the given number of blocks, ending at a new intersection.
 
 There's no time to follow such ridiculous instructions on foot, though, so you take a moment and work out the destination. Given that you can only walk on the street grid of the city, how far is the shortest path to the destination?
 
 For example:
 
 Following R2, L3 leaves you 2 blocks East and 3 blocks North, or 5 blocks away.
 R2, R2, R2 leaves you 2 blocks due South of your starting position, which is 2 blocks away.
 R5, L5, R5, R3 leaves you 12 blocks away.
 */

let instructions = "R2, L5, L4, L5, R4, R1, L4, R5, R3, R1, L1, L1, R4, L4, L1, R4, L4, R4, L3, R5, R4, R1, R3, L1, L1, R1, L2, R5, L4, L3, R1, L2, L2, R192, L3, R5, R48, R5, L2, R76, R4, R2, R1, L1, L5, L1, R185, L5, L1, R5, L4, R1, R3, L4, L3, R1, L5, R4, L4, R4, R5, L3, L1, L2, L4, L3, L4, R2, R2, L3, L5, R2, R5, L1, R1, L3, L5, L3, R4, L4, R3, L1, R5, L3, R2, R4, R2, L1, R3, L1, L3, L5, R4, R5, R2, R2, L5, L3, L1, L1, L5, L2, L3, R3, R3, L3, L4, L5, R2, L1, R1, R3, R4, L2, R1, L1, R3, R3, L4, L2, R5, R5, L1, R4, L5, L5, R1, L5, R4, R2, L1, L4, R1, L1, L1, L5, R3, R4, L2, R1, R2, R1, R1, R3, L5, R1, R4"

enum Direction {
  case East, West, North, South
}

struct Location {
  var x: Int
  var y: Int
  var facing: Direction
}

func shortestPath(for instructions: String) -> Int {
  var location = Location(x: 0, y: 0, facing: .North)
  
  for instruction in instructions.components(separatedBy: ", ") {
    guard let turn = instruction.characters.first,
      let move = Int(instruction.substring(from: instruction.index(after: instruction.startIndex))) else {
        fatalError("Error while getting required information from the instruction")
    }
    
    switch (turn, location.facing) {
    case ("R", .North):
      location.facing = .East
      location.x += move
    case ("R", .East):
      location.facing = .South
      location.y -= move
    case ("R", .South):
      location.facing = .West
      location.x -= move
    case("R", .West):
      location.facing = .North
      location.y += move
    case ("L", .North):
      location.facing = .West
      location.x -= move
    case ("L", .West):
      location.facing = .South
      location.y -= move
    case ("L", .South):
      location.facing = .East
      location.x += move
    case ("L", .East):
      location.facing = .North
      location.y += move
    
    default:
      break
    }
  }
  
  return abs(location.x) + abs(location.y)
}

