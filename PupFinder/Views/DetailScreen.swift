import SwiftUI

//This view is responsible for displaying deatiled view of selected dog
struct DetailScreen: View {
    var dog: Dog

    var body: some View {
        ZStack {
            Color.white
            
            ScrollView  {
                // Dog Image
                if let url = URL(string: dog.imageLink) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .padding(.top, 100)
                    } placeholder: {
                        Rectangle().foregroundColor(.secondary)
                    }
                }
                
                DescriptionView(dog: dog)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .navigationBarTitle("")
    }
}

struct DescriptionView: View {
    var dog: Dog

    var body: some View {
        VStack (alignment: .leading) {
            // Dog name
            Text(dog.name)
                .font(.title)
                .fontWeight(.bold)
                .padding()

            GroupBox(label: Text("Physical Attributes")) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Height: \(dog.max_height_male) cm")
                        Text("Weight: \(dog.max_weight_male) kg")
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Life Expectancy: \(dog.minLifeExpectancy)-\(dog.maxLifeExpectancy) years")
                        Text("Coat Length: \(dog.coatLength)")
                    }
                }
            }
            .padding()

            GroupBox(label: Text("Behavioral Traits")) {
                VStack(alignment: .leading) {
                    Spacer().frame(height: 10)
                    Text("Playfulness: \(dog.playfulness)/5")
                    ProgressView(value: Double(dog.playfulness), total: 5)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color.teal))
                    Text("Protectiveness: \(dog.protectiveness)/5")
                    ProgressView(value: Double(dog.protectiveness), total: 5)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color.teal))
                    Text("Trainability: \(dog.trainability)/5")
                    ProgressView(value: Double(dog.trainability), total: 5)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color.teal))
                }
            }
            .padding()

            GroupBox(label: Text("Compatibility")) {
                Spacer().frame(height: 10)
                VStack(alignment: .leading) {
                    Text("Good With Children: \(dog.goodWithChildren)/5")
                    ProgressView(value: Double(dog.goodWithChildren), total: 5)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color.teal))
                    Text("Good With Other Dogs: \(dog.goodWithOtherDogs)/5")
                    ProgressView(value: Double(dog.goodWithOtherDogs), total: 5)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color.teal))
                    Text("Good With Strangers: \(dog.goodWithStrangers)/5")
                    ProgressView(value: Double(dog.goodWithStrangers), total: 5)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color.teal))
                }
            }
            .padding()
        }
        .padding(.top)
        .background(Color.white)
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        let dogViewModel = DogViewModel()
        DetailScreen(dog: dogViewModel.getDummyData())
    }
}
