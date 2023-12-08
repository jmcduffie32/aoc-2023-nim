import std/tables
import std/strutils
import std/strformat
import regex

const str2int = {
  "one": 1,
  "1": 1,
  "two": 2,
  "2": 2,
  "three": 3,
  "3": 3,
  "four": 4,
  "4": 4,
  "five": 5,
  "5": 5,
  "six": 6,
  "6": 6,
  "seven": 7,
  "7": 7,
  "eight": 8,
  "8": 8,
  "nine": 9,
  "9": 9
}.toTable

let lines: seq[string] = splitlines(readFile("day1_input.txt"))[0..^2]
const p = re2(r"(?=(\d|one|two|three|four|five|six|seven|eight|nine))")
var sum = 0

for line in lines:
  let matches = findAll(line, p)
  let digit1 = str2int[line[matches[0].group(0)]]
  let digit2 = str2int[line[matches[^1].group(0)]]
  let code: int = parseInt(&"{digit1}{digit2}")
  sum += code

echo(sum)
    
