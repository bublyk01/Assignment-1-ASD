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
            
            printInformation(students: list.students)
        } catch {
            print("Could not open the .json file: \(error)")
        }
    }
    
    private func printInformation(students: [Student]) {
        for student in students {
            print("\nStudent ID: \(student.id)")
            print("Name: \(student.name)")
            print("Age: \(String(describing: student.age))")
            print("Subjects: \(String(describing: student.subjects?.joined(separator: ", ")))")
            print("Address: \(String(describing: student.address?.street)), \(String(describing: student.address?.city)), \(String(describing: student.address?.postalCode))")
            print("Scores:")
            if let scores = student.scores {
                print("\tMath: \(String(describing: scores.Math))")
                print("\tPhysics: \(String(describing: scores.Physics))")
                if let chemistryScore = scores.Chemistry {
                    print("\tChemistry: \(chemistryScore)")
                } else {
                    print("\tChemistry: N/A")
                }
            } else {
                print("\tScores: N/A")
            }

            if let hasScholarship = student.hasScholarship {
                print("Has Scholarship: \(hasScholarship ? "Yes" : "No")")
            } else {
                print("Has Scholarship: N/A")
            }
            print("Graduation Year: \(student.graduationYear)")
        }
    }
}

let parser = ModelParser()
parser.JSONReader(filePath: "/Users/volodya/Desktop/Assignment-1-ASD/students.json")
