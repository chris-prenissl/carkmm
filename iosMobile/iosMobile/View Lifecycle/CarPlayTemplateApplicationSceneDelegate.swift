/*
See LICENSE folder for this sample’s licensing information.

Abstract:
`TemplateApplicationSceneDelegate` is the delegate for the `CPTemplateApplicationScene` on the CarPlay display.
*/

import CarPlay
import UIKit

class CarPlayTemplateApplicationSceneDelegate: NSObject {
    
    let templateManager = TemplateManager()
    
    // MARK: UISceneDelegate
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if scene is CPTemplateApplicationScene, session.configuration.name == "TemplateSceneConfiguration" {
            MemoryLogger.shared.appendEvent("Template application scene will connect.")
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        if scene.session.configuration.name == "TemplateSceneConfiguration" {
            MemoryLogger.shared.appendEvent("Template application scene did disconnect.")
        }
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        if scene.session.configuration.name == "TemplateSceneConfiguration" {
            MemoryLogger.shared.appendEvent("Template application scene did become active.")
        }
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        if scene.session.configuration.name == "TemplateSceneConfiguration" {
            MemoryLogger.shared.appendEvent("Template application scene will resign active.")
        }
    }
    
}

// MARK: CPTemplateApplicationSceneDelegate

extension CarPlayTemplateApplicationSceneDelegate: CPTemplateApplicationSceneDelegate {
    
    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didConnect interfaceController: CPInterfaceController) {
        MemoryLogger.shared.appendEvent("Template application scene did connect.")
        templateManager.interfaceControllerDidConnect(interfaceController, scene: templateApplicationScene)
    }
    
    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
                                  didDisconnectInterfaceController interfaceController: CPInterfaceController) {
        MemoryLogger.shared.appendEvent("Template application scene did disconnect.")
        templateManager.interfaceControllerDidDisconnect(interfaceController, scene: templateApplicationScene)
    }
}
