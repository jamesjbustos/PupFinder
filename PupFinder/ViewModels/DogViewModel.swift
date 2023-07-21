import SwiftUI
import Combine

// Network Call
class DogViewModel: ObservableObject {
    @Published var dogs = [Dog]()
    @Published var isLoading = false

    func fetchDogs(for breed: String) {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/dogs?name="+breed.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else { return }
        var request = URLRequest(url: url)
        request.setValue("yudSUUkVkhIonutJYp5obg==adTWH5UIbXn9DQSZ", forHTTPHeaderField: "X-Api-Key")

        isLoading = true
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            if let decodedData = try? JSONDecoder().decode([Dog].self, from: data) {
                DispatchQueue.main.async {
                    self.dogs = decodedData
                    self.isLoading = false
                }
            }
        }.resume()
    }
    
    // Dummy data for screen views
    func getDummyData() -> Dog {
        return Dog(imageLink: "https://api-ninjas.com/images/dogs/american_bulldog.jpg",
                   goodWithChildren: 4,
                   goodWithOtherDogs: 3,
                   shedding: 2,
                   grooming: 4,
                   drooling: 1,
                   coatLength: 3,
                   goodWithStrangers: 5,
                   playfulness: 4,
                   protectiveness: 3,
                   trainability: 5,
                   energy: 5,
                   barking: 2,
                   minLifeExpectancy: 10,
                   maxLifeExpectancy: 15,
                   max_height_male: 60,
                   max_height_female: 55,
                   max_weight_male: 80,
                   max_weight_female: 70,
                   min_height_male: 50,
                   min_height_female: 45,
                   min_weight_male: 60,
                   min_weight_female: 50,
                   name: "Bulldog")
    }
    
}

