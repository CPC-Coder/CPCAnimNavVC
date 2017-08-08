# CPCAnimNavVC
转场动画的导航栏
#只需对导航设置下代理就可以使用了,超级简单易用

![image](https://github.com/CPC-Coder/TransionTool/raw/master/1.gif)
![image](https://github.com/CPC-Coder/TransionTool/raw/master/2.gif)

###let tool = TransionTool.share
###tool.animType = .transionAnim
###tool.duration = 0.8
###nav.delegate = tool

  	func application(_ application: UIApplication,
  	didFinishLaunchingWithOptions
  	launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
  	-> Bool {

        let win = UIWindow()
        let vc = ViewController()
        vc.title = "xx"
        let nav = UINavigationController(rootViewController: vc)
        
        
        let tool = TransionTool.share
        tool.animType = .transionAnim
        tool.duration = 0.8
        nav.delegate = tool
        
        
        
        let tabC = UITabBarController()
        tabC.viewControllers = [nav,nav]
        
        win.rootViewController = tabC
        window = win
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    
    
