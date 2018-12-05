//
//  main.swift
//  adventofcode1
//
//  Created by Cruse, Si on 12/1/18.
//  Copyright © 2018 Cruse, Si. All rights reserved.
//

import Foundation

// Utility functions

func testit(scenario: (input: [Int], expected: Int), process: ([Int]) -> Int) -> String {
    let result = process(scenario.input)
    return "\(result == scenario.expected ? "\u{1F49A}" : "\u{1F6D1}")\texpected \(scenario.expected)\tresult \(result)\tinput: \(scenario.input)"
}

let input = [-16,    12,    -18,    -1,    5,    -8,    9,    -15,    12,    6,    11,    7,    -9,    13,    5,    -4,    -4,    -2,    -5,    19,    4,    14,    7,    8,    -16,    -9,    16,    8,    -11,    -7,    12,    8,    13,    11,    12,    -19,    11,    7,    9,    -7,    -16,    -5,    11,    -1,    8,    5,    12,    -1,    -1,    6,    -2,    -12,    6,    -18,    11,    5,    13,    -12,    -15,    -8,    -13,    2,    -11,    1,    -14,    -6,    11,    -15,    11,    8,    18,    -8,    18,    -7,    -9,    -24,    -12,    2,    20,    -9,    -5,    -14,    -6,    16,    -1,    -12,    -16,    8,    9,    -15,    -8,    -2,    -4,    -16,    -18,    -8,    10,    10,    2,    3,    -8,    -10,    -1,    -2,    20,    -5,    -4,    -13,    10,    9,    -12,    -19,    15,    -4,    -13,    -11,    -9,    -4,    -12,    3,    -7,    -4,    13,    8,    -5,    10,    -11,    7,    10,    13,    10,    -17,    -21,    11,    3,    9,    -15,    -11,    15,    10,    -3,    17,    6,    11,    16,    19,    8,    8,    4,    9,    7,    15,    2,    15,    22,    19,    11,    3,    19,    9,    -4,    9,    -19,    -16,    6,    2,    -3,    5,    5,    -18,    1,    -14,    -6,    -20,    10,    -13,    19,    -18,    -17,    5,    -39,    2,    33,    2,    24,    -16,    45,    9,    21,    6,    20,    4,    -12,    -7,    -3,    8,    12,    5,    -1,    8,    18,    -13,    -9,    3,    16,    -4,    15,    13,    -10,    -8,    -13,    -21,    15,    17,    13,    -4,    -18,    -15,    3,    11,    5,    3,    10,    -11,    9,    19,    -2,    9,    3,    -13,    2,    -7,    -14,    -2,    -7,    -19,    7,    3,    -13,    6,    10,    5,    -9,    -20,    -8,    5,    -17,    11,    -12,    17,    -12,    -14,    24,    -22,    -13,    15,    15,    1,    -4,    13,    -30,    12,    17,    8,    45,    4,    -3,    -5,    3,    -9,    13,    8,    14,    2,    -12,    -3,    9,    20,    7,    1,    1,    -17,    -10,    3,    -2,    4,    -6,    16,    -8,    15,    16,    8,    -11,    -14,    -4,    2,    15,    19,    12,    14,    17,    -18,    -18,    -18,    -1,    -1,    -7,    -17,    -2,    -18,    15,    -3,    5,    -20,    39,    -1,    6,    8,    10,    16,    -19,    11,    19,    15,    -6,    19,    -8,    6,    1,    -2,    -20,    -4,    18,    2,    -17,    -10,    -10,    -12,    18,    2,    -16,    -8,    14,    -15,    12,    -14,    -19,    -16,    -21,    -17,    21,    -12,    -34,    -22,    -25,    -15,    14,    -12,    -10,    11,    -20,    4,    -6,    -11,    14,    21,    74,    40,    3,    15,    -4,    16,    12,    3,    6,    2,    11,    10,    -3,    17,    -5,    10,    13,    5,    -13,    -4,    13,    -8,    17,    -2,    6,    -12,    7,    2,    13,    -2,    -9,    18,    15,    -11,    4,    3,    -21,    -17,    3,    12,    -1,    -12,    -3,    -20,    -10,    13,    -6,    -4,    -20,    7,    15,    -6,    -15,    -26,    13,    6,    -23,    -9,    -1,    44,    8,    -14,    26,    13,    5,    31,    24,    7,    -2,    7,    -4,    17,    -16,    -3,    36,    -10,    -22,    -11,    62,    -7,    21,    -17,    -10,    -18,    11,    4,    5,    -23,    -26,    -40,    2,    32,    62,    23,    45,    109,    -37,    -10,    -99,    -210,    -21,    -33,    379,    262,    66,    66407,    13,    -8,    -14,    -16,    -6,    -19,    12,    15,    -10,    -19,    -8,    12,    13,    -11,    18,    7,    -11,    14,    -12,    -11,    -2,    4,    -19,    -9,    3,    -5,    7,    -4,    9,    -19,    20,    7,    -14,    -2,    -7,    -8,    -2,    -16,    8,    -10,    1,    -4,    -16,    2,    1,    -13,    -2,    -3,    -16,    5,    -6,    -17,    3,    9,    14,    1,    -11,    6,    -2,    -12,    -10,    11,    19,    -9,    5,    -11,    -8,    -17,    -19,    8,    -3,    -17,    13,    14,    -16,    -8,    19,    17,    -16,    -16,    -13,    -11,    9,    -19,    6,    12,    5,    -12,    -12,    -16,    -14,    -6,    7,    8,    -12,    -18,    12,    13,    -17,    3,    -5,    1,    6,    -4,    -18,    1,    11,    2,    -8,    -15,    -17,    16,    -10,    -12,    16,    -14,    -1,    -11,    5,    14,    20,    16,    -18,    16,    17,    13,    -9,    -6,    -16,    19,    13,    8,    -13,    1,    19,    -12,    -20,    -20,    -11,    -12,    4,    12,    6,    -17,    -9,    -3,    -18,    -15,    -2,    -5,    17,    12,    -8,    4,    -12,    -7,    -18,    -4,    -1,    -19,    1,    -7,    -8,    5,    1,    19,    -7,    -19,    18,    12,    6,    19,    8,    -1,    20,    -17,    -16,    -5,    -1,    -3,    6,    -13,    -2,    6,    -8,    12,    -13,    -3,    -13,    8,    4,    -16,    19,    18,    16,    -13,    -1,    3,    9,    18,    1,    3,    14,    10,    3,    1,    -8,    18,    4,    26,    22,    13,    -12,    -7,    -3,    6,    -17,    5,    14,    -7,    12,    10,    -7,    8,    -7,    18,    17,    -6,    12,    17,    2,    3,    -9,    18,    10,    -17,    -10,    -2,    -13,    6,    4,    17,    12,    14,    -15,    5,    17,    4,    -1,    -14,    -19,    -1,    5,    -15,    -16,    1,    -11,    -13,    -5,    15,    -4,    -15,    1,    22,    17,    -20,    -21,    13,    1,    -2,    17,    23,    -35,    -14,    -18,    6,    1,    1,    -13,    -10,    34,    35,    8,    4,    14,    24,    16,    -5,    -2,    10,    16,    -10,    -11,    1,    -2,    -3,    7,    5,    20,    -14,    2,    2,    -5,    14,    -18,    23,    -3,    2,    4,    2,    7,    8,    3,    -16,    -5,    4,    12,    -20,    -15,    -22,    5,    -10,    31,    -2,    9,    10,    -14,    18,    6,    3,    19,    -15,    9,    7,    18,    -1,    -8,    19,    12,    1,    16,    -5,    -4,    -9,    16,    13,    2,    7,    5,    -3,    -19,    12,    9,    2,    9,    16,    -17,    -13,    12,    -5,    11,    4,    -1,    2,    -6,    18,    19,    -10,    3,    -19,    -19,    -13,    -16,    -2,    -13,    8,    18,    6,    -11,    2,    -16,    11,    12,    -20,    18,    17,    14,    -13,    26,    -1,    20,    -1,    -17,    -11,    -8,    13,    -7,    -5,    -5,    -7,    18,    -20,    -4,    29,    -2,    21,    21,    16,    15,    14,    21,    -15,    -14,    17,    5,    -10,    -27,    -18,    10,    -20,    34,    -13,    18,    17,    -21,    32,    13,    6,    6,    28,    -37,    20,    29,    -25,    -69,    -57,    -3,    -59,    3,    -21,    -9,    14,    -19,    -18,    20,    -5,    15,    5,    -9,    -24,    20,    -14,    -10,    -15,    30,    21,    -9,    -34,    4,    -31,    25,    -85,    25,    38,    -36,    -28,    58,    121,    -31,    13,    202,    66221,    -5,    -19,    -10,    -7,    -8,    -2,    6,    -5,    -6,    8,    -17,    10,    18,    16,    3,    -12,    -2,    -11,    14,    7,    11,    -1,    -5,    10,    9,    -5,    -3,    -3,    -11,    -13,    18,    -8,    -5,    18,    17,    -6,    3,    19,    -18,    5,    5,    -4,    -12,    7,    14,    19,    -6,    10,    -8,    -11,    10,    -17,    9,    11,    7,    -133358]


// --- Day 1: Chronal Calibration ---

//    After feeling like you've been falling for a few minutes, you look at the device's tiny screen. "Error: Device must be calibrated before first use. Frequency drift detected. Cannot maintain destination lock." Below the message, the device shows a sequence of changes in frequency (your puzzle input). A value like +6 means the current frequency increases by 6; a value like -3 means the current frequency decreases by 3.
//
//    For example, if the device displays frequency changes of +1, -2, +3, +1, then starting from a frequency of zero, the following changes would occur:
//
//    Current frequency  0, change of +1; resulting frequency  1.
//    Current frequency  1, change of -2; resulting frequency -1.
//    Current frequency -1, change of +3; resulting frequency  2.
//    Current frequency  2, change of +1; resulting frequency  3.
//    In this example, the resulting frequency is 3.
//
//    Here are other example situations:
//
//    +1, +1, +1 results in  3
//    +1, +1, -2 results in  0
//    -1, -2, -3 results in -6
//    Starting with a frequency of zero, what is the resulting frequency after all of the changes in frequency have been applied?

// Test Scenarios
let challenge_test_1 = [
    ([1, -2, 3, 1], 3),
    ([1, 1, 1], 3),
    ([1, 1, -2], 0),
    ([-1, -2, -3], -6)
]

func frequencyAdjust(changes: [Int]) -> Int {
    return changes.reduce(0, { total, adjustment in total + adjustment})
}

// Validate pasphrase tests pass
for scenario in challenge_test_1 { print(testit(scenario: scenario, process: frequencyAdjust)) }

print("The FIRST CHALLENGE answer is \(frequencyAdjust(changes: input))\n")
//
//        --- Part Two ---
//    You notice that the device repeats the same frequency change list over and over. To calibrate the device, you need to find the first frequency it reaches twice.
//
//    For example, using the same list of changes above, the device would loop as follows:
//
//    Current frequency  0, change of +1; resulting frequency  1.
//    Current frequency  1, change of -2; resulting frequency -1.
//    Current frequency -1, change of +3; resulting frequency  2.
//    Current frequency  2, change of +1; resulting frequency  3.
//    (At this point, the device continues from the start of the list.)
//    Current frequency  3, change of +1; resulting frequency  4.
//    Current frequency  4, change of -2; resulting frequency  2, which has already been seen.
//    In this example, the first frequency reached twice is 2. Note that your device might need to repeat its list of frequency changes many times before a duplicate frequency is found, and that duplicates might be found while in the middle of processing the list.
//
//    Here are other examples:
//
//    +1, -1 first reaches 0 twice.
//    +3, +3, +4, -2, -4 first reaches 10 twice.
//    -6, +3, +8, +5, -6 first reaches 5 twice.
//    +7, +7, -2, -7, -4 first reaches 14 twice.
//    What is the first frequency your device reaches twice?

// Test Scenarios
let challenge_test_2 = [
    ([1, -2, 3, 1], 2),
    ([1,-1],0),
    ([3,3,4,-2,-4], 10),
    ([-6,3,8,5,-6], 5),
    ([7,7,-2,-7,-4], 14)
]

func frequencyAdjust2(changes: [Int]) -> Int {
    var frequency = 0
    var seen = [0:true]
    var repeatFrequency: Int? = nil
    while repeatFrequency == nil {
        for c in changes {
            frequency += c
            if let f = seen[frequency] {
                repeatFrequency = frequency
                break
            } else {
                seen[frequency] = true
            }
        }
    }
    return repeatFrequency!
}

// Validate pasphrase tests pass
for scenario in challenge_test_2 { print(testit(scenario: scenario, process: frequencyAdjust2)) }

print("The SECOND CHALLENGE answer is \(frequencyAdjust2(changes: input))\n")
