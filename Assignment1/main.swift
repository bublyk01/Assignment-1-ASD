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
