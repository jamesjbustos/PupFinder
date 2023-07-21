import SwiftUI

struct MainView: View {
  @StateObject private var dogViewModel = DogViewModel()
  @State private var isActive: Bool = false

  var body: some View {
    NavigationView {
      VStack {
        VStack {
          HStack {
            Text("PupFinder")
              .font(.title)
              .fontWeight(.bold)
              .foregroundColor(Color(hex: "464646"))

            Spacer()
          }
          .padding(.horizontal)

          SearchBar { searchTerm in
            dogViewModel.fetchDogs(for: searchTerm)
            isActive = true
          }
          .environmentObject(dogViewModel)
          .padding(.horizontal)

          Buttons()  // Buttons View
            .padding(.vertical, 20)
          Cards()  // Cards View
            .padding(.top, 20)

          Spacer()

          NavigationLink(
            destination: DogListView().environmentObject(dogViewModel), isActive: $isActive
          ) {
            EmptyView()
          }.navigationTitle("")
        }
        .padding(.top, 20)

        Tabbar()
          .offset(y: 35)
      }
    }
    .navigationTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
}

struct SearchBar: View {
  @EnvironmentObject var dogViewModel: DogViewModel
  @State private var searchTerm: String = ""
  var onCommit: (String) -> Void = { _ in }

  var body: some View {
    HStack {
      TextField(
        "Search for a breed...", text: $searchTerm,
        onCommit: {
          onCommit(searchTerm)
        }
      )
      .padding(10)
      .background(Color(.systemGray6))
      .cornerRadius(8)

      Button(action: {
        onCommit(searchTerm)
      }) {
        Image(systemName: "magnifyingglass")
          .foregroundColor(.white)
          .padding(10)
          .background(Color.teal)
          .clipShape(Circle())
      }
      .padding(.horizontal)
    }
  }
}

//Tabbar
struct Tabbar: View {
  var body: some View {
    HStack(spacing: 60) {
      VStack {
        Image(systemName: "house")
          .font(.system(size: 26))
          .foregroundColor(.white)
        Circle()
          .frame(width: 6, height: 6)
          .foregroundColor(.white)
      }
      VStack {
        Image(systemName: "heart")
          .font(.system(size: 26))
          .foregroundColor(.white)
        Circle()
          .frame(width: 6, height: 6)
          .foregroundColor(.white)
          .opacity(0)
      }
      VStack {
        Image(systemName: "bell")
          .font(.system(size: 26))
          .foregroundColor(.white)
        Circle()
          .frame(width: 6, height: 6)
          .foregroundColor(.white)
          .opacity(0)
      }
      VStack {
        Image(systemName: "person")
          .font(.system(size: 26))
          .foregroundColor(.white)
        Circle()
          .frame(width: 6, height: 6)
          .foregroundColor(.white)
          .opacity(0)
      }
    }
    .frame(height: 84)
    .frame(maxWidth: .infinity)
    .background(Color.teal)
    .cornerRadius(20)
    .edgesIgnoringSafeArea(.bottom)
  }
}

struct Cards: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Resources")
        .font(.system(size: 22, weight: .bold))
        .foregroundColor(Color.teal)

      ScrollView(.horizontal) {
        HStack(spacing: 40) {
          VStack {
            Image("dog2")
              .resizable()
              .aspectRatio(contentMode: .fill)
            VStack(alignment: .leading) {
              Text("Adoption Process Explained")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(hex: "464646"))
                .padding(.horizontal, 10)
              Text("Step-by-step guide to bringing your new friend home")
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Color(hex: "464646"))
                .lineLimit(3)
                .padding(.top, 5)
                .padding(.leading, 10)
                .padding(.bottom, 15)
            }
            .frame(height: 100)
          }
          .frame(width: 280, height: 340)
          .background(Color.white)
          .cornerRadius(30)
          VStack {
            Image("dog1")
              .resizable()
              .aspectRatio(contentMode: .fill)
            VStack(alignment: .leading) {
              Text("Understanding Your Dog's Behavior")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(hex: "464646"))
                .padding(.horizontal, 10)
              Text("Decipher the secret language of dogs.")
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Color(hex: "464646"))
                .lineLimit(3)
                .padding(.top, 5)
                .padding(.leading, 10)
                .padding(.bottom, 15)
            }
            .frame(height: 100)
          }
          .frame(width: 280, height: 340)
          .background(Color.white)
          .cornerRadius(30)
        }
      }
      .padding(.top, 10)
    }
    .padding(.leading, 30)
  }
}

struct Buttons: View {
  var body: some View {
    VStack {
      HStack(spacing: 35) {
        VStack {
          ZStack {
            Image(systemName: "clock")
              .font(.system(size: 24))
              .foregroundColor(.white)
          }
          .frame(width: 60, height: 60)
          .background(Color.teal)
          .cornerRadius(10)

          Text("Recent")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(Color.teal)
            .padding(.top, 10)
        }

        VStack {
          ZStack {
            Image(systemName: "mappin.and.ellipse")
              .font(.system(size: 24))
              .foregroundColor(.gray)
          }
          .frame(width: 60, height: 60)
          .background(Color.white)
          .cornerRadius(10)
          Text("Locations")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.gray)
            .padding(.top, 10)
        }
        VStack {
          ZStack {
            Image(systemName: "heart")
              .font(.system(size: 24))
              .foregroundColor(.gray)
          }
          .frame(width: 60, height: 60)
          .background(Color.white)
          .cornerRadius(10)
          Text("Favorites")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.gray)
            .padding(.top, 10)
        }
        VStack {
          ZStack {
            Image(systemName: "bubble.left")
              .font(.system(size: 24))
              .foregroundColor(.gray)
          }
          .frame(width: 60, height: 60)
          .background(Color.white)
          .cornerRadius(10)
          Text("Chat")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.gray)
            .padding(.top, 10)
        }

      }

    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
