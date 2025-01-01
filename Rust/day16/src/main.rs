use std::fs::File;
use std::io::BufRead;
use std::io::BufReader;
//use std::path::Path;

struct Pos {
    row: i32,
    col: i32,
}

struct Dir {
    x: i32,
    y: i32,
}

impl Pos {
    fn next(&self, dir: &Dir) -> Pos {
        Pos {
            row: self.row + dir.y,
            col: self.col + dir.x,
        }
    }
}

impl Dir {
    fn next_1(&self) -> Dir {
        if self.x == 0 {
            Dir { x: 1, y: 0 }
        } else {
            Dir { x: 0, y: 1 }
        }
    }

    fn next_2(&self) -> Dir {
        if self.x == 0 {
            Dir { x: -1, y: 0 }
        } else {
            Dir { x: 0, y: -1 }
        }
    }
}

fn main() {
    println!("Hello, world!");
    //let input = get_input(true);

    //println!("{}", input.chars().collect()[2]);
    let maze = get_input();
    pretty_print(&maze);
    maze_start(&maze);
}

fn maze_start(maze: &[Vec<char>]) {
    //let mut row = 0;
    //let mut col = 0;

    for (row, m_row) in maze.iter().enumerate() {
        for (col, m_col) in m_row.iter().enumerate() {
            if *m_col == 'S' {
                let start_row = row as i32;
                let start_col = col as i32;
                println!("Starting at: {}, {}", start_row, start_col);
                maze_do(
                    maze,
                    Pos {
                        row: start_row,
                        col: start_col,
                    },
                    Dir { x: 1, y: 0 },
                    0,
                );
            }
        }
    }
}

fn maze_do(maze: &[Vec<char>], pos: Pos, dir: Dir, cost: u64) {
    let n_pos = pos.next(&dir);
    let n_dir1 = dir.next_1();
    let n_dir2 = dir.next_2();
    let n_pos1 = pos.next(&n_dir1);
    let n_pos2 = pos.next(&n_dir2);

    if check(maze, &n_pos) {
        let row = n_pos.row as usize;
        let col = n_pos.col as usize;

        if maze[row][col] == 'E' {
            //pretty_print(maze);
            println!("${}", cost + 1);
            return;
        } else if maze[row][col] == '.' {
            let mut c_maze = maze.to_owned();
            c_maze[row][col] = '*';
            maze_do(&c_maze, n_pos, dir, cost + 1);
        }
    }

    if check(maze, &n_pos1) {
        let row = n_pos1.row as usize;
        let col = n_pos1.col as usize;

        if maze[row][col] == 'E' {
            println!("${}", cost + 1001);
            return;
        } else if maze[row][col] == '.' {
            let mut c_maze = maze.to_owned();
            c_maze[row][col] = '*';
            maze_do(&c_maze, n_pos1, n_dir1, cost + 1001);
        }
    }

    if check(maze, &n_pos2) {
        let row = n_pos2.row as usize;
        let col = n_pos2.col as usize;

        if maze[row][col] == 'E' {
            println!("${}", cost + 1001);
        } else if maze[row][col] == '.' {
            let mut c_maze = maze.to_owned();
            c_maze[row][col] = '*';
            maze_do(&c_maze, n_pos2, n_dir2, cost + 1001);
        }
    }
}

fn check(maze: &[Vec<char>], new_pos: &Pos) -> bool {
    new_pos.row >= 0
        && (new_pos.row as usize) < maze.len()
        && new_pos.col >= 0
        && (new_pos.col as usize) < maze[0].len()
}

fn get_input() -> Vec<Vec<char>> {
    let _input = "###############
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
###############"
        .split("\n");

    let _input = "#################
#...#...#...#..E#
#.#.#.#.#.#.#.#.#
#.#.#.#...#...#.#
#.#.#.#.###.#.#.#
#...#.#.#.....#.#
#.#.#.#.#.#####.#
#.#...#.#.#.....#
#.#.#####.#.###.#
#.#.#.......#...#
#.#.###.#####.###
#.#.#...#.....#.#
#.#.#.#####.###.#
#.#.#.........#.#
#.#.#.#########.#
#S#.............#
#################"
        .split("\n");

    let file = File::open("input.txt").unwrap();
    let br = BufReader::new(file);

    let input = br.lines();

    let mut vec_input = Vec::<Vec<char>>::new();

    for iline in input {
        let uiline = iline.unwrap();
        //iline + 4;
        //println!("{:?}", uiline);
        //println!("{:?}", line.split("").collect::<Vec<&str>>());
        vec_input.push(uiline.chars().collect());
    }

    vec_input
}

fn pretty_print(maze: &[Vec<char>]) {
    let mut row = 0;
    let mut col = 0;

    let mut line1 = String::from("    ");
    let mut line2 = String::from("    ");
    let mut line3 = String::from("    ");
    for _item in &maze[0] {
        if col / 100 != 0 && col % 10 == 0 {
            line1 = format!("{}{}", line1, col / 100);
        } else {
            line1 = format!("{}{}", line1, " ");
        }

        if col / 10 != 0 && col % 10 == 0 {
            line2 = format!("{}{}", line2, (col % 100) / 10);
        } else {
            line2 = format!("{}{}", line2, " ");
        }

        line3 = format!("{}{}", line3, (col % 100) % 10);
        //print!("{}", col);
        col += 1;
    }

    println!("{}\n{}\n{}\n", line1, line2, line3);

    for line in maze {
        col = 0;
        if row / 100 > 0 && row % 10 == 0 {
            print!("{}", row / 100);
        } else {
            print!("{}", " ");
        }

        if row / 10 > 0 && row % 10 == 0 {
            print!("{}", (row % 100) / 10);
        } else {
            print!("{}", " ");
        }

        print!("{} ", row % 10);

        //print!("{} ", row % 10);

        for item in line {
            print!("{}", item);
            col += 1;
        }
        println!();
        row += 1;
    }
}
