// converter.rs

use std::env;
use std::process::Command;

fn convert_file(input_path: &str, output_path: &str, conversion_type: &str) {
    match conversion_type {
        "word_to_pdf" => word_to_pdf(input_path, output_path),
        "excel_to_pdf" => excel_to_pdf(input_path, output_path),
        "pdf_to_jpg" => pdf_to_jpg(input_path, output_path),
        "pdf_to_word" => pdf_to_word(input_path, output_path),
        "pdf_to_powerpoint" => pdf_to_powerpoint(input_path, output_path),
        "pdf_to_excel" => pdf_to_excel(input_path, output_path),
        "powerpoint_to_pdf" => powerpoint_to_pdf(input_path, output_path),
        "jpg_to_pdf" => jpg_to_pdf(input_path, output_path),
        _ => println!("Unsupported conversion type"),
    }
}

fn word_to_pdf(input_path: &str, output_path: &str) {
    Command::new("pandoc")
        .arg(input_path)
        .arg("-o")
        .arg(output_path)
        .spawn()
        .expect("Failed to convert Word to PDF");
}

fn excel_to_pdf(input_path: &str, output_path: &str) {
    Command::new("pandoc")
        .arg(input_path)
        .arg("-o")
        .arg(output_path)
        .spawn()
        .expect("Failed to convert Excel to PDF");
}

fn pdf_to_jpg(input_path: &str, output_path: &str) {
    Command::new("pdftoppm")
        .arg("-jpeg")
        .arg(input_path)
        .arg(output_path)
        .spawn()
        .expect("Failed to convert PDF to JPG");
}

fn pdf_to_word(input_path: &str, output_path: &str) {
    Command::new("pandoc")
        .arg(input_path)
        .arg("-o")
        .arg(output_path)
        .spawn()
        .expect("Failed to convert PDF to Word");
}
fn pdf_to_powerpoint(input_path: &str, output_path: &str) {
    // Using an imaginary tool named 'pdf2ppt' for PDF to PowerPoint conversion
    Command::new("pdf2ppt")
        .arg(input_path)
        .arg("-o")
        .arg(output_path)
        .spawn()
        .expect("Failed to convert PDF to PowerPoint");
}

fn pdf_to_excel(input_path: &str, output_path: &str) {
    // Using an imaginary tool named 'pdf2excel' for PDF to Excel conversion
    Command::new("pdf2excel")
        .arg(input_path)
        .arg("-o")
        .arg(output_path)
        .spawn()
        .expect("Failed to convert PDF to Excel");
}

fn powerpoint_to_pdf(input_path: &str, output_path: &str) {
    // Using an imaginary tool named 'ppt2pdf' for PowerPoint to PDF conversion
    Command::new("ppt2pdf")
        .arg(input_path)
        .arg("-o")
        .arg(output_path)
        .spawn()
        .expect("Failed to convert PowerPoint to PDF");
}

fn jpg_to_pdf(input_path: &str, output_path: &str) {
    // Using an imaginary tool named 'jpg2pdf' for JPG to PDF conversion
    Command::new("jpg2pdf")
        .arg(input_path)
        .arg("-o")
        .arg(output_path)
        .spawn()
        .expect("Failed to convert JPG to PDF");
}

// ...

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() <= 2 || args.len() > 50 {
        println!("Usage: converter <input_path1> <input_path2> ... <output_path> <conversion_type>");
        std::process::exit(1);
    }

    let input_paths: Vec<&str> = args.iter().skip(1).take(args.len() - 2).map(|s| s.as_str()).collect();
    let output_path = &args[args.len() - 2];
    let conversion_type = &args[args.len() - 1];

    convert_file(input_paths[0], output_path, conversion_type);
}


