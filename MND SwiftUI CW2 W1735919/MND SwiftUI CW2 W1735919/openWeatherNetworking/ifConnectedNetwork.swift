
// NETWROK ERROR CHECK CODED BUT NOT IMPLEMENTED PROGMATICALLY IN VIEWS

import Foundation
import Network

final class ifConnectedNetwork : ObservableObject{
    let check = NWPathMonitor()
    let queue = DispatchQueue(label: "Check")
    
    @Published var isConnected = true
    init() {
        check.pathUpdateHandler = { [weak self]  path in
        DispatchQueue.main.async {
            self?.isConnected = path.status == .satisfied ? true : false
        }
    }
        check.start(queue: queue)
    }
}
