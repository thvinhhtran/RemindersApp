import SwiftUI



struct CameraView: View {
    @State private var imageData: Data?  = nil
    @State private var showCamera: Bool = false
    
    
    var body: some View {
        VStack{
            if let imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.gray)
            }
            Button("Take Photo") {
                showCamera = true
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    CameraView()
}
