//
//  main.swift
//  AdventOfCode2016
//
//  Created by Techniexe on 02/12/16.
//  Copyright © 2016 Ekantik Tech. All rights reserved.
//

import Foundation

let location = shortestPath(for: instructions)

// Print Answer of Day 1
print("Day 1 Answer: ", abs(location.coordinate.x) + abs(location.coordinate.y))

// Print answer of Day 1 Part 2. The distance of first point visited again.
if let firstCoordinateRevisited = location.getCoordinatesRevisited().first {
  print("Day 1 Part 2 Answer: ", abs(firstCoordinateRevisited.x) + abs(firstCoordinateRevisited.y))
}
