import SwiftUI
import UniformTypeIdentifiers

struct FilePickerView: UIViewControllerRepresentable {
    var onFilePicked: (URL) -> Void

    func makeCoordinator() -> Coordinator {
        return Coordinator(self, onFilePicked: onFilePicked)
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let controller = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.image, UTType.pdf], asCopy: true)
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) { }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: FilePickerView
        var onFilePicked: (URL) -> Void

        init(_ parent: FilePickerView, onFilePicked: @escaping (URL) -> Void) {
            self.parent = parent
            self.onFilePicked = onFilePicked
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if let url = urls.first {
                self.onFilePicked(url)
            }
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            print("Document picker was cancelled")
        }
    }
}

struct FilePickerView_Previews: PreviewProvider {
    static var previews: some View {
        FilePickerView(onFilePicked: { _ in })
    }
}
