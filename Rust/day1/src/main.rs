use std::fs::File;
use std::io::Read;
use std::path::Path;
//use std::vec;

fn main() {
    let path = Path::new("day1_input.txt");

    let mut file = File::open(&path).expect("Need valid file.");

    let mut s = String::new();
    file.read_to_string(&mut s).expect("Reading to string.");

    let mut list1: Vec<i32> = Vec::new();
    let mut list2: Vec<i32> = Vec::new();
    let mut totdist = 0;

    for line in s.lines() {
        let mut split_iter = line.split_whitespace();

        let element1 = split_iter.next().unwrap().parse::<i32>().unwrap();
        let element2 = split_iter.next().unwrap().parse::<i32>().unwrap();

        list1.push(element1);
        list2.push(element2);
    }

    list1.sort();
    list2.sort();

    for i in 0..list1.len() {
        totdist += (list1[i] - list2[i]).abs();
    }

    let mut sumdiff = 0;

    for element1 in &list1 {
        for element2 in &list2 {
            if element1 == element2 {
                sumdiff += element1;
            }
        }
    }

    println!("{}", totdist);
    println!("{}", sumdiff);
}

