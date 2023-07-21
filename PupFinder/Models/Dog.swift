import Foundation

//JSON Data Model

struct Dog: Codable, Identifiable {
    let id = UUID()
    let imageLink: String
    let goodWithChildren: Int
    let goodWithOtherDogs: Int
    let shedding: Int
    let grooming: Int
    let drooling: Int
    let coatLength: Int
    let goodWithStrangers: Int
    let playfulness: Int
    let protectiveness: Int
    let trainability: Int
    let energy: Int
    let barking: Int
    let minLifeExpectancy: Int
    let maxLifeExpectancy: Int
    let max_height_male: Int
    let max_height_female: Int
    let max_weight_male: Int
    let max_weight_female: Int
    let min_height_male: Int
    let min_height_female: Int
    let min_weight_male: Int
    let min_weight_female: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case imageLink = "image_link"
        case goodWithChildren = "good_with_children"
        case goodWithOtherDogs = "good_with_other_dogs"
        case shedding
        case grooming
        case drooling
        case coatLength = "coat_length"
        case goodWithStrangers = "good_with_strangers"
        case playfulness
        case protectiveness
        case trainability
        case energy
        case barking
        case minLifeExpectancy = "min_life_expectancy"
        case maxLifeExpectancy = "max_life_expectancy"
        case max_height_male
        case max_height_female
        case max_weight_male
        case max_weight_female
        case min_height_male
        case min_height_female
        case min_weight_male
        case min_weight_female
        case name
    }
}
