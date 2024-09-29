import Foundation


struct Scores: Codable {
    let Math: Int?
    let Physics: Int?
    let Chemistry: Int?
}

struct Address: Codable {
    let street: String
    let city: String
    let postalCode: String?
}

struct Student: Codable {
    let id: Int
    let name: String
    let age: Int?
    let subjects: [String]?
    let address: Address?
    let scores: Scores?
    let hasScholarship: Bool?
    let graduationYear: Int?
}

struct List: Codable {
    let students: [Student]
}

class ModelParser {
    func JSONReader(filePath: String) {
        let fileURL = URL(fileURLWithPath: filePath)
        
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let list = try decoder.decode(List.self, from: data)
            
            HighestAge(students: list.students)
            
        } catch {
            print("Could not open the .json file: \(error)")
        }
    }
    
    func HighestAge(students: [Student]) {
        let nonNil = students.filter { $0.age != nil }
        
        if let highestAge = nonNil.max(by: { $0.age! < $1.age! }) {
            print("Student: \(highestAge.name) had the highest age of \(highestAge.age!)")
        } else {
            print("No valid students found with a non-nil age.")
        }
    }
}

let parser = ModelParser()
parser.JSONReader(filePath: "/Users/volodya/Desktop/Assignment-1-ASD/students.json")
