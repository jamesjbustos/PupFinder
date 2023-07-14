import SwiftUI

struct WelcomeView: View {
    @State private var isActive = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color.teal.edgesIgnoringSafeArea(.all)
                    VStack {
                        // Top half
                        VStack {
                            HStack {
                                Text("PupFinder")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top)

                            Image("dog")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)

                            Spacer()
                        }

                        ZStack {
                            Color.white
                                .cornerRadius(60, corners: [.topLeft, .topRight])
                                .edgesIgnoringSafeArea(.bottom)

                            // Bottom half
                            VStack {
                                Text("Discover Your \n Pawfect Pup")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hex: "464646"))

                                HStack {
                                    Text("Find your ideal ")
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color(hex: "464646"))
                                    +
                                    Text("furry friend.")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(hex: "97BF5A"))
                                }
                                .padding(.top, 5)
                                .padding(.bottom, 5)

                                // Button
                                NavigationLink(
                                    destination: DogPreferencesView(),
                                    isActive: $isActive
                                ) {
                                    Button(action: {
                                        self.isActive = true
                                    }) {
                                        Text("Get Started")
                                            .font(.title3)
                                            .frame(maxWidth: .infinity)
                                            .fontWeight(.bold)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Color.teal)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.teal, lineWidth: 2)
                                            )
                                    }
                                }
                                .padding(.top, 30) // Increased from default spacing
                                .padding()
                            }
                        }
                        .frame(height: geometry.size.height / 2)
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
