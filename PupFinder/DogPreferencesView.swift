import SwiftUI

struct DogPreferencesView: View {
    @State private var name: String = ""
    @State private var minHeight: String = ""
    @State private var maxHeight: String = ""
    @State private var minWeight: String = ""
    @State private var maxWeight: String = ""
    @State private var minLifeExpectancy: String = ""
    @State private var maxLifeExpectancy: String = ""
    @State private var shedding: Double = 1
    @State private var barking: Double = 1
    @State private var energy: Double = 1
    @State private var protectiveness: Double = 1
    @State private var trainability: Double = 1

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Dog Breed")) {
                    TextField("Name", text: $name)
                }

                Section(header: Text("Size")) {
                    TextField("Minimum Height (in)", text: $minHeight)
                    TextField("Maximum Height (in)", text: $maxHeight)
                    TextField("Minimum Weight (lbs)", text: $minWeight)
                    TextField("Maximum Weight (lbs)", text: $maxWeight)
                }

                Section(header: Text("Life Expectancy")) {
                    TextField("Minimum (years)", text: $minLifeExpectancy)
                    TextField("Maximum (years)", text: $maxLifeExpectancy)
                }

                Section(header: Text("Characteristics")) {
                    LabeledSlider(label: "Shedding", value: $shedding)
                    LabeledSlider(label: "Barking", value: $barking)
                    LabeledSlider(label: "Energy", value: $energy)
                    LabeledSlider(label: "Protectiveness", value: $protectiveness)
                    LabeledSlider(label: "Trainability", value: $trainability)
                }
                Section {
                    Button(action: {
                        submitPreferences()
                    }) {
                        Text("Submit")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color.teal)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }.listRowBackground(Color.clear)
            }
            .tint(.teal)
            .foregroundColor(Color(hex: "464646"))
            .navigationBarTitle("Dog Preferences")
            .background(.ultraThinMaterial)
            .scrollContentBackground(.hidden)
        }
    }
    
    func submitPreferences() {
        // Validate the inputs

        // Format the inputs for the API request

        // Send the API request
    }
}

struct LabeledSlider: View {
    var label: String
    @Binding var value: Double

    var body: some View {
        VStack {
            Slider(value: $value, in: 1...5, step: 1)
            Text("\(label): \(Int(value))")
        }
    }
}

struct DogPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        DogPreferencesView()
    }
}
