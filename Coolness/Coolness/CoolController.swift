import UIKit

class CoolController: UIViewController
{
    override func loadView() {
        print("Loading...")
        view = CoolView(frame: UIScreen.main.bounds)
    }
}
