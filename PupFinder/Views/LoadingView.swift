
import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            Text("🐶")
                .font(.system(size: 80))
            ProgressView()
            Text("Fetching the dogs...")
                .foregroundColor(.gray)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
