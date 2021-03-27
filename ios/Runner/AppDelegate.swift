import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    private let nfcService = NFCService()
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let nfcChannel = FlutterMethodChannel(name: "idrop.lib/nfc", binaryMessenger: controller.binaryMessenger)

        nfcChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            guard let self = self else { return }
            if call.method == "writeNfc" {
                print("writeNFc method called")
                guard
                    let urlString = call.arguments as? String,
                    let url = URL(string: urlString)
                else {
                    print("couldn't map url from arguments, args: \(String(describing: call.arguments))")
                    return
                }
                
                print(url)
                self.nfcService.writeTag(url: url)
                result(true)
            } else {
                result(FlutterMethodNotImplemented)
            }
        })

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
