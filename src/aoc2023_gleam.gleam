import gleam/list
import gleam/io
import gleam/int
import gleam/string
import simplifile

pub fn main() {
  let assert Ok(contents) = simplifile.read("./day1.txt")
  contents
  |> string.split("\n")
  |> list.filter(fn(x) { !string.is_empty(x) })
  |> part1
}

fn part1(lines: List(String)) {
  lines
  |> list.map(get_outer_digits)
  |> list.map(construct_num)
  |> int.sum
  |> int.to_string
  |> io.println
}

fn part2(lines: List(String)) {
  let num_words = [
    "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
    "Ten",
  ]
  todo
}

fn get_outer_digits(string: String) -> #(String, String) {
  let assert Ok(first) =
    string
    |> string.to_graphemes
    |> list.find(is_digit)

  let assert Ok(last) =
    string
    |> string.reverse
    |> string.to_graphemes
    |> list.find(is_digit)

  #(first, last)
}

fn is_digit(grapheme: String) -> Bool {
  case
    grapheme
    |> int.parse
  {
    Ok(_) -> True
    Error(_) -> False
  }
}

fn construct_num(num_pair: #(String, String)) -> Int {
  let num_str = num_pair.0 <> num_pair.1
  let assert Ok(num) =
    num_str
    |> int.parse
  num
}
