#  tips

## navigation

### tabBarItem.title  设置

#### 1. TabBarVC 创建每个子Nav控制器的时候设置有效

CHNavBillVC *navBillCtr = [[CHNavBillVC alloc] initWithRootViewController:viewVC];
navBillCtr.tabBarItem.title = @"账单"; //设置标题

#### 2. 每个子Nav控制的viewDidLoad里设置无效

viewWillAppear里设置有效
self.tabBarItem.title = @“账单1”;

#### 3. 每个子Nav控制器的根控制器里viewDidLoad里可以设置

self.title = @"账单2"
self.tabBarItem.title = @“tabBar的title"; //这样设置无效

优先级: 3 > 2 > 1 即同时设置的话, 显示优先级高的内容
重点: 在每个子Nav控制器的根控制器里 self.title可以控制tabBarItem的title

### navigationItem.title 设置

#### 1.TabBarVC 创建每个子Nav控制器的时候设置无效

CHNavBillVC *navBillCtr = [[CHNavBillVC alloc] initWithRootViewController:viewVC];
navBillCtr.navigationItem.title = @“Nav"; //无效

#### 2.每个子Nav控制的viewDidLoad, viewWillAppear里设置都无效

self.navigationItem.title = @“账单"; //都无效

#### 3.每个子Nav控制器的根控制器里viewDidLoad里可以设置

self.title = @“微信";
self.navigationItem.title = @"dsadsa";
优先级:只有3可以设置, 但self.navigationItem.title > self.title, 所以这种优先级可以完成tabBarItem.title和navigationItem.tiltle不一样的显示

