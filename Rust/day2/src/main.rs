use std::fs::File;
use std::io::Read;
use std::path::Path;

fn main() {
    let data_string = read_file(Path::new("day2_input.txt"));

    let mut safe_count = 0;
    let mut damper_safe_count = 0;

    for line in data_string.lines() {
        let i32_line = to_i32_vector(&line);

        if is_safe(&i32_line) {
            safe_count += 1;
        }
        if is_safe_damper(&i32_line) {
            damper_safe_count += 1;
        }
    }

    println!("Part 1 result: {}", safe_count);
    println!("Part 2 result: {}", damper_safe_count);
}

fn is_safe(row: &Vec<i32>) -> bool {
    let mut i=0;
    let mut has_positive = false;
    let mut has_negative = false;
    
    loop {
        let e1 = row[i];
        let e2 = row[i+1];

        if e1 - e2 > 0 && e1 - e2 <= 3 {
            if has_negative {
                return false;
            }
            has_positive = true;
        }
        else if e1 - e2 < 0 && e1 - e2 >= -3 {
            if has_positive {
                return false;
            }
            has_negative = true;
        }
        else {
            return false;
        }

        if i < row.len()-2 {
            i = i + 1;
        }
        else {
            break;
        }
    }

    return true;
}

fn is_safe_damper(row: &Vec<i32>) -> bool {
    if is_safe(row) {
        return true;
    }
    else {
        for index in 0..row.len() {
            let mut new_vec = row.clone();
            new_vec.remove(index);

            if is_safe(&new_vec) {
                return true;
            }
        }
    }

    return false;
}


fn read_file(path: &Path) -> String {
    let display = path.display();
    let mut file = match File::open(&path) {
        Err(why) => panic!("couldn't open {}: {}", path.display(), why),
        Ok(file) => file,
    };

    let mut s = String::new();
    match file.read_to_string(&mut s) {
        Err(why) => panic!("couldn't read {}: {}", display, why),
        Ok(_) => (),
    }

    return s;
}

fn to_i32_vector(input_string: &str) -> Vec<i32> {
    let mut result = Vec::<i32>::new();

    let split_string = input_string.split_whitespace();

    for item in split_string {
        result.push(item.parse::<i32>().unwrap());
    }

    return result;
}
