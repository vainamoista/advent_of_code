use std::fs::File;
use std::io::BufReader;

fn main() {
    let file = File::open("day4_input.txt").unwrap();
    let mut br = BufReader::new(file);
    let mut text = String::new();
    buf_reader.read_to_string(&mut text).unwrap();
}

fn xmas(text) {
    println!("{}",text.len());
}
