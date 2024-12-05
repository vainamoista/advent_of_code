use std::collections::BTreeMap;
use std::fs::File;
use std::io::prelude::*;
use std::io::BufReader;

fn main() {
    let file = File::open("day5_input.txt").unwrap();
    let mut br = BufReader::new(file);
    let mut text = String::new();
    br.read_to_string(&mut text).unwrap();

    let result: Vec<i32> = part1(&text);

    println!("Part 1: {}", result[0]);
    println!("Part 2: {}", result[1]);
}

fn part1(text: &str) -> Vec<i32> {
    let mut kieletty_kartta = BTreeMap::<&str, Vec<&str>>::new();

    // loop through the first part of input text; the beginning part should be
    // of the form <val1>|<val2> and is a list of certain value pairs that always
    // need to be in sequence in a list (i.e., <value1> MUST come before <value2>,
    // or the list is invalid)
    for line in text.lines() {
        if line.contains("|") {
            let split: Vec<&str> = line.split("|").collect();
            if !kieletty_kartta.contains_key(&split[1]) {
                kieletty_kartta.insert(split[1], vec![split[0]]);
            } else {
                kieletty_kartta
                    .get_mut(split[1])
                    .expect("vector")
                    .push(split[0]);
            }
        } else {
            break;
        }
    }

    // count is for part 1, count2 is for part 2
    let mut count = 0;
    let mut count2 = 0;

    for line in text.lines() {
        if line.contains(",") {
            let mut passed = true;
            let mut kieletty = Vec::<&str>::new();
            let sequence: Vec<&str> = line.split(",").collect();
            for value in &sequence {
                if kieletty.contains(value) {
                    passed = false;
                    break;
                } else {
                    if kieletty_kartta.contains_key(value) {
                        for item in kieletty_kartta.get(value).unwrap() {
                            kieletty.push(item);
                        }
                    }
                }
            }
            if passed {
                count += sequence[sequence.len() / 2].parse::<i32>().unwrap();
            } else {
                count2 += korjaa(sequence, &kieletty_kartta);
            }
        }
    }

    let mut result = Vec::<i32>::new();
    result.push(count);
    result.push(count2);

    return result;
}

fn korjaa(mut list: Vec<&str>, rules: &BTreeMap<&str, Vec<&str>>) -> i32 {
    /*
     * Given a sequence that does not follow all of the rules,
     * find an offending item within the sequence that occurs
     * after something it should not, and swap it with its 
     * previous neighbor. Repeat this process until there are no
     * offending items.
     */

    let mut fixed = false;
    let mut kieletty = Vec::<&str>::new();

    while !fixed {
        // fixed always turns back to false within the nested for loop if
        // there is something offensive
        fixed = true;
        // each time through the embedded for loop we need to begin with a 
        // clear slate of which values are verboten
        kieletty.clear();
        for i in 0..list.len() {
            let value = list.get(i).unwrap();
            // Offending item found: swap with neighbor at i-1
            if kieletty.contains(value) {
                list.swap(i, i-1);
                // we're gonna have to loop again to make sure
                // nothing else is amiss
                fixed = false;
                break;
            } else if rules.contains_key(value) {
                // Add all the verboten values that cannot come
                // after the current value
                for item in rules.get(value).unwrap() {
                    kieletty.push(item);
                }
            }
        }
    }

    // As per the instructions, return the value of the middle element
    // of the fixed array
    return list[list.len() / 2].parse::<i32>().unwrap();
}
