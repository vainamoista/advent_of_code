use std::fs;
//use std::io;
//use std::io::prelude::*;

fn main() {
    get_input();
}

fn get_input() -> Vec<&str> {

    let text = fs::read_to_string("input.txt").unwrap();
    println!("Input text is: {}", text);
    //let text = "125 17";

    //let text: Vec<String> = text.split(' ').collect();
    let text: Vec<&str> = text.split(' ').collect();
    println!("{}", text[0]);

    return text;
}
