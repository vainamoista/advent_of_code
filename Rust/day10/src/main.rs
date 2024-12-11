fn main() {
    get_input();
}

fn get_input() {
    let test = "89010123\n78121874\n87430965\n96549874\n45678903\n32019012\n01329801\n10456732";

    let test: Vec<&str> = test.split("\n").map(|x| x.split("")).collect();

    println!("{}", test.collect().nth(0));
}
