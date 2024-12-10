use std::fs::File;
use std::io::prelude::*;
use std::io::BufReader;

fn get_input() -> String {
    let f = File::open("input.txt").unwrap();
    let mut br = BufReader::new(f);
    let mut text = String::new();
    br.read_to_string(&mut text).unwrap();

    return text;
}

fn main() {
    part1();
}

fn part1() {
    let input = get_input();

    let mut num_blocks = 0;

    let char_it = input.chars();
    loop {
        
    }
    let int_val = i.parse().unwrap();

        num_blocks += int_val;
    }

    println!("{}", input.len());
}
