import SwiftUI
import RealityKit
import MBProgressHUD

struct ProgressHUD: UIViewRepresentable {
    @Binding var isShowing: Bool
    let text: String

    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        if isShowing {
            let hud = MBProgressHUD.showAdded(to: uiView, animated: true)
            hud.label.text = text
        } else {
            MBProgressHUD.hide(for: uiView, animated: true)
        }
    }
}

// Usage example:
struct ContentView: View {
    @State private var showingHUD = false

    var body: some View {
        VStack {
            Button("Toggle HUD") {
                withAnimation {
                    self.showingHUD.toggle()
                }
            }
            ProgressHUD(isShowing: $showingHUD, text: "Loading...")
                .frame(height: 200)
                .opacity(showingHUD ? 1 : 0)
        }.padding()
    }
}



#Preview(windowStyle: .automatic) {
    ContentView()
}
