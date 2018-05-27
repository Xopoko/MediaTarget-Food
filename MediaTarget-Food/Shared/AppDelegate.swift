import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        routeToMain()
        return true
    }
    
    func routeToMain() {
        guard let mainVC: MainScreenViewController = AppDelegate.storyboardInstance() else { return }
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nc = UINavigationController(rootViewController: mainVC)
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
}

extension AppDelegate {
    static func storyboardInstance<T: UIViewController>() -> T? {
        let storyBoard = UIStoryboard(name: String(describing: T.self), bundle: nil)
        return storyBoard.instantiateInitialViewController() as? T
    }
}
