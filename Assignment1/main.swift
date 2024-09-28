import Foundation

struct Scores: Codable {
    let Math: Int
    let Physics: Int
    let Chemistry: Int
}

struct Address: Codable {
    let street: String
    let city: String
    let postalCode: String
}

struct Student: Codable {
    let id: Int
    let name: String
    let age: Int
    let subjects: [String]
    let address: Address
    let scores: Scores
    let hasScholarship: Bool
    let graduationYear: Int
}

struct List: Codable {
    let students: [Student]
}

class ModelParser {
    func JSONReader(filename: String) {
        let getPath = URL(filePath: FileManager.default.currentDirectoryPath, directoryHint: .isDirectory)
        let path = URL(filePath: filename, relativeTo: getPath).appendingPathExtension("json")
        
        do {
            let data = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            let List = try decoder.decode(List.self, from: data)
            
            //printInformation(students: studentsList.students)
        }
        catch{
            print("Could not open the file")
        }
    }
}
