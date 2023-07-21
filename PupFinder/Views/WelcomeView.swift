import SwiftUI

// App Onboarding View
struct WelcomeView: View {
    @State private var isActive = false

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color.teal.edgesIgnoringSafeArea(.all)
                    VStack {
                        TopHalfView()

                        BottomHalfView()
                            .frame(height: geometry.size.height / 2)
                    }
                }
            }
            .navigationDestination(for: String.self) { value in
                if value == "MainView" {
                    MainView()
                }
            }
        }
    }
}

struct TopHalfView: View {
    var body: some View {
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
    }
}

struct BottomHalfView: View {
    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(60, corners: [.topLeft, .topRight])
                .edgesIgnoringSafeArea(.bottom)

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

                NavigationLink("Get Started", value: "MainView")
                    .buttonStyle(.bordered)
                    .frame(maxWidth: .infinity)
                    .controlSize(.large)
                    .tint(.teal)
                    .padding(.top, 30)
                    .padding()
                    .navigationTitle("")
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
