use std::fs::File;
use std::io::BufReader;
use std::io::prelude::*;

fn main() {
    let file = File::open("day6_input.txt").unwrap();
    let mut br = BufReader::new(file);
    let mut text = String::new();
    br.read_to_string(&mut text).unwrap();
}

fn part1(map: Vec<&str>) {
    let local_map = map.clone();
    let mut row: i32 = -1;
    let mut col: i32 = -1;

    // Finding the initial position of guard
    for i in 0..local_map.len() {
        for j in 0..local_map[i].len() {
            if local_map[i][j] == "^" {
                row = i;
                col = j;
                local_map[i][j] = "X";
                break;
            }
        }
    }
}
