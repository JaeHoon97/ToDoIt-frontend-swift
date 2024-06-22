//
//  SceneDelegate.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationViewController = UINavigationController(rootViewController: AuthSelectionViewController())
        navigationViewController.navigationItem.backBarButtonItem?.tintColor = .black
        window?.rootViewController = navigationViewController
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()

    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if(AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
    
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func changeRootViewController() { // 사용자가 로그인에 성공할 경우 루트 뷰 컨트롤러를 변경해주는 함수
        guard let window = self.window else { return }
        
        let tabBarController = UITabBarController() // 탭 바 컨트롤러
        
        // 각 화면에 맞는 뷰 컨트롤러를 생성한 후, 네비게이션 컨트롤러의 루트 뷰 컨트롤러로 지정한다
        let homeViewController =  HomeViewController() // 투 두 뷰 컨트롤러
        let scheduleViewController = ScheduleViewController() // 개인 일정 뷰 컨트롤러
        let userInfoViewController = UserInfoViewController() // 사용자 정보 뷰 컨트롤러
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let scheduleNavigationController = UINavigationController(rootViewController: scheduleViewController)
        
        let homeNaviAppearance = UINavigationBarAppearance()
        homeNaviAppearance.backgroundColor = .white
        
        homeNaviAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: FontManager.Jalnan2, size: 23)!]
        homeNaviAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: FontManager.Jalnan2, size: 15)!]
        
        homeNavigationController.navigationBar.standardAppearance = homeNaviAppearance
        homeNavigationController.navigationBar.scrollEdgeAppearance = homeNaviAppearance
        homeNavigationController.navigationBar.compactAppearance = homeNaviAppearance
        homeNavigationController.navigationBar.prefersLargeTitles = true
        
        
        
        tabBarController.setViewControllers([homeNavigationController, scheduleNavigationController, userInfoViewController], animated: false)
        tabBarController.modalPresentationStyle = .fullScreen // 화면을 풀스크린으로 변경
        tabBarController.tabBar.backgroundColor = AppColors.shared.tabBarBackGroundColor
        tabBarController.tabBar.tintColor = .black
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: FontManager.Jalnan2, size: 10)]
        UITabBarItem.appearance().setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        
        guard let tabItems = tabBarController.tabBar.items else { return }
        
        tabItems[0].image = UIImage(named: "HomeIcon")
        tabItems[0].title = "투두"
        tabItems[1].image = UIImage(named: "CalendarIcon")
        tabItems[1].title = "일정"
        tabItems[2].image = UIImage(systemName: "gearshape")
        tabItems[2].title = "설정"
        
        window.rootViewController = tabBarController // 루트 뷰 컨트롤러를 메인 탭 바 컨트롤러로 변경
        
        UIView.transition(with: window, duration: 0.2, options: .transitionCrossDissolve, animations: nil, completion: nil)
        window.makeKeyAndVisible()
    }
    
}

