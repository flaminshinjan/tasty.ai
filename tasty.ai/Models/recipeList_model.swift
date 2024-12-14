import Foundation

struct RecipeAPIResponse: Codable {
    let data: RecipeData
    let meta: MetaData
    let status: Bool
    let message: String
}

struct RecipeData: Codable {
    let count: Int
    let results: [Recipe]
    let prev: String?
    let next: String?
}

struct Recipe: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let thumbnailURL: String?
    let cookTimeMinutes: Int?
    let prepTimeMinutes: Int?
    let totalTimeMinutes: Int?
    let instructions: [Instruction]?
    let nutrition: Nutrition?
    let videoURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnailURL = "thumbnail_url"
        case cookTimeMinutes = "cook_time_minutes"
        case prepTimeMinutes = "prep_time_minutes"
        case totalTimeMinutes = "total_time_minutes"
        case instructions
        case nutrition
        case videoURL = "video_url"
    }
}

struct Instruction: Codable {
    let displayText: String

    enum CodingKeys: String, CodingKey {
        case displayText = "display_text"
    }
}

struct Nutrition: Codable {
    let calories: Int?
    let carbohydrates: Int?
    let fat: Int?
    let fiber: Int?
    let protein: Int?
    let sugar: Int?
}

struct MetaData: Codable {
    let currentPage: Int
    let limit: Int
    let totalRecords: Int
    let totalPage: Int

    enum CodingKeys: String, CodingKey {
        case currentPage
        case limit
        case totalRecords
        case totalPage
    }
}
