
import SwiftUI

struct ARViewWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ARViewController {
        let ar_view = ARViewController()
        return ar_view
    }
    
    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {
        
    }
    class Coordinator : NSObject {

    }
    
    func makeCoordinator() -> ARViewWrapper.Coordinator {
        Coordinator()
    }
}
