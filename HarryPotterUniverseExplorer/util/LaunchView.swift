import SwiftUI

struct LaunchView: View {
    
    var body: some View {
        ZStack() {
            Color.branding.background
                .ignoresSafeArea()
            VStack(alignment: .center,
                   spacing: 0.0) {
                Image("logo-transparent")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
                   .minimumScaleFactor(0.3)
                   .frame(width: 247, height: 266)
        }
    }
    
}

#Preview {
    LaunchView()
}
