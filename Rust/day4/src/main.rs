use std::fs::File;
use std::io::BufReader;
use std::io::prelude::*;

fn main() {
    let file = File::open("day4_input.txt").unwrap();
    let mut br = BufReader::new(file);
    let mut text = String::new();
    br.read_to_string(&mut text).unwrap();

    text = "MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX".to_string();

    xmas(&text);
}

fn xmas(text: Vec<&str>) {
    println!("{}",text.len());

    for i in 0..text.len() {
        for j in 0..text[i].len() {
        }
    }
}

fn search_mas(text: Vec<&str>, row: usize, column: usize, to_right: i32, to_down: i32) {
    if row < 0 || row > text.len()-1 {
        return false;
    } else if column < 1 || column > text.get(row).len()-1 {
        return false;
    }

    if to_right == 1 {
        if column > text[row].len() - 3 {
            return false;
        }
    } else if to_right == -1 {
        if column < 2 {
            return false;
        }
    }

    if to_down == 1 {
        if row > text.len() - 3 {
            return false;
        }
    } else if to_down == -1 {
        if row < 2 {
            return false;
        }
    }

    let isM = text[row + to_down*0][column + to_right*0] == 'M';
}


fn east(text: &str, row: u32, column: u32) {
}

