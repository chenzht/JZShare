# JZShare
### 1. 引入

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
![](http://upload-images.jianshu.io/upload_images/530671-3679da46b84a6cdb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
