# JZShare
### 1. 引入
首先，请自行下载ShareSDK，我使用的是3.30，下载地址 [ShareSDK For iOS v3.3.0](http://www.mob.com/#/downloadDetail/ShareSDK/ios)
并将ShareSDK拖入工程根目录，如下图所示

![](http://img.blog.csdn.net/20160528062006681)

再将文件夹JZShare里的内容导入你的工程，然后引入

```
#import "JZShareCustom.h"
```

### 2. 在相应方法里调用

```
//1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"分享里的图片.png"]];
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"JZShare，自定义你的Mob分享UI"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://www.kohmax.com"]
                                          title:@"JZShare"
                                           type:SSDKContentTypeAuto];
        
        
        //调用自定义分享
        [JZShareCustom shareWithContent:shareParams];
    }
    
```

### 3. 实际效果
![](http://img.blog.csdn.net/20160528062222010)
