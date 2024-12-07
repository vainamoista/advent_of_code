use std::collections::HashMap;
use std::fs::File;
use std::io::prelude::*;
use std::io::BufReader;

fn main() {
    let f = File::open("day6_input.txt").unwrap();
    let mut br = BufReader::new(f);
    let mut text = String::new();
    br.read_to_string(&mut text).unwrap();

    /*text = "....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...".to_string();*/

    part1(&text);
}

fn str_array(text: &str) -> Vec<Vec<&str>> {
    let lines: Vec<&str> = text.split("\n").collect();
    let mut result: Vec<Vec<&str>> = Vec::<Vec<&str>>::new();

    let mut counter = 0;
    for line in lines {
        result.push(line.split("").collect());
        if (counter == 0) {
            println!(">{},{},{},{}",result[0][0],result[0][1],result[0][2],result[0][3]);
            counter += 1;
        }

    }

    return result;
}



fn part1(text: &str) {
    let the_lines: Vec<&str> = text.split("\n").collect();
    println!("Lines: {}", the_lines[0].chars().nth(0).unwrap());
    let n_rows = the_lines.len();
    let n_cols = the_lines[0].len();

    let mut the_map: Vec<Vec<&str>> = str_array(&text);

    let mut row_index: usize = usize::MAX;
    let mut col_index: usize = usize::MAX;
    let mut found: bool = false;

    for i in 0..n_rows {
        for j in 0..n_cols {
            if the_map[i][j] == "^" {
                found = true;
                row_index = i;
                col_index = j;
                break;
            }
        }
        if found {
            break;
        }
    }

    let mut x = row_index;
    let mut y = col_index;
    let mut dir: &str = "N";

    let directions: HashMap<&str, [i32; 2]> = HashMap::from([
        ("N", [-1,0]),
        ("S", [1,0]),
        ("E", [0,1]),
        ("W", [0,-1])]);
    let next_direction = HashMap::from([
        ("N", "E"),
        ("E", "S"),
        ("S", "W"),
        ("W", "N")]);

    loop {
        the_map[x][y] = "X";
        let new_x = x as i32 + directions[dir][0];
        let new_y = y as i32 + directions[dir][1];
        let temp_pos = [new_x, new_y];

        if new_x < 0 || new_x+1 >= (the_map.len() as i32) || new_y < 0 || new_y >= (the_map[0].len() as i32) {
            break;
        } else if the_map[new_x as usize][new_y as usize] == "#" {
            dir = next_direction[dir];
        } else {
            the_map[x][y] = "X";
            x = new_x as usize;
            y = new_y as usize;
        }
    }

    the_map[21][131] = "Y";
    the_map[22][131] = "Y";
    the_map[24][0] = "B";

    println!("The map [10][0] is: {}", the_map[10][0]);

    let f = File::open("output.txt").unwrap();
    let mut br = BufReader::new(f);
    let mut text = String::new();
    br.read_to_string(&mut text).unwrap();
    let the_good_map: Vec<Vec<&str>> = str_array(&text);

    let mut count = 0;

    /*for i in 0..n_rows {
        for j in 0..n_cols {
            println!("{},{}",i,j);
            if the_map[i][j] != the_good_map[i][j] {
                print!("O");
            } else {
                print!(".");
            }
        }
        println!();
    }*/


    let mut ii = 0;
    let mut jj = 0;
    let mut count17 = 0;
    println!(">>>{}<<<",the_map[0].len());
    for row in &the_map {
        println!("{}",row.len());
        print!("{}: ", ii);
        for element in row {
            print!("{}",element);
            //print!("{} ", jj);
            jj+=1;
            if *element == "X" {
                count += 1;
                if ii==17 {
                    count17 += 1;
                }
            }
        }
        ii+=1;
        println!("{}",jj);
        jj =0;
        println!();
    }

}
