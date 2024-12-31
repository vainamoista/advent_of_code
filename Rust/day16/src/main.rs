use std::fs::File;
use std::io::BufReader;
use std::path::Path;

fn main() {
    println!("Hello, world!");
    let input = get_input(true);

    //println!("{}", input.chars().collect()[2]);
}

fn get_input(testing: bool) -> String {
    let input: &str;

    if testing {
        input = "###############
#.......#....E#
#.#.###.#.###.#
#.....#.#...#.#
#.###.#####.#.#
#.#.#.......#.#
#.#.#####.###.#
#...........#.#
###.#.#####.#.#
#...#.....#.#.#
#.#.#.###.#.#.#
#.....#...#.#.#
#.###.#.#.#.#.#
#S..#.....#...#
###############";
    } else {
        let file = File::open("input.txt")?;
        input = "load input";
    }

    let mut input_array: Vec<Vec<String>> = Vec::new();

    input.to_string()
}
