use std::fs::File;

fn main() {
    let text_map = get_input();
}

fn get_input() -> Vec<Vec<char>> {
    let text = File::read_to_string("input.txt").unwrap();

    let lines_of_text = text.split("\n").collect::<Vec<&str>>();
    let n_rows = lines_of_text.len();
    let n_cols = lines_of_text[0].len();
    let mut str_arr: Vec<Vec<char>> = Vec::<Vec<char>>::with_capacity(n_rows * n_cols);

    //let mut i = 0;
    for (i, line) in lines_of_text.into_iter().enumerate() {
        str_arr.push(Vec::<char>::new());
        let line_chars = line.chars();

        for item in line_chars {
            str_arr[i].push(item);
        }
    }

    return str_arr;
}

fn part1(text_map: Vec<Vec<char>>) {
    let mut done_map = text_map.clone();

    let mut i=0;
    let mut j=0;
    let mut all_visited = false;

    while !all_visited  {
        all_visited = true;

        for i=0..text_map.len() {
            for j=0..text_map[i].len() {
                if done_map[i][j] != '.' {
                    
                }
            }
        }
    }
}
    

