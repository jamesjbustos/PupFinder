import SwiftUI

// DogListView displays a list of dogs fetched from the view model
struct DogListView: View {
    @EnvironmentObject var dogViewModel: DogViewModel

    private let cellImageWidth: CGFloat = 75
    private let cellImageHeight: CGFloat = 75

    var body: some View {
        Group {
            if dogViewModel.isLoading {
                LoadingView()
            } else {
                VStack {
                    // Title
                    Text("Search Results")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom)

                    // List of Dogs
                    List(dogViewModel.dogs, id: \.id) { dog in
                        NavigationLink(destination: DetailScreen(dog: dog)) {
                            DogCellView(dog: dog)
                        }
                    }
                }.background(Color(.systemGray6))
            }
        }
        .navigationBarTitle("")
    }

    // A cell view representing a dog
    private func DogCellView(dog: Dog) -> some View {
        HStack {
            AsyncImage(url: URL(string: dog.imageLink)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
            .frame(width: cellImageWidth, height: cellImageHeight)

            Text(dog.name)
                .font(.title2)
        }
        .padding(.vertical)
    }
}


struct DogListView_Previews: PreviewProvider {
    static var previews: some View {
        DogListView().environmentObject(DogViewModel())
    }
}
