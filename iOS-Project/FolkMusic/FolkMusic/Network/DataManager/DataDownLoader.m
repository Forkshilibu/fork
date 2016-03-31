//
//  DataDownLoader.m
//  UParking
//
//  Created by CheWei on 15/8/24.
//  Copyright (c) 2015年 yu. All rights reserved.
//

#import "DataDownLoader.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

//#import "LoginViewController.h"

@implementation DataDownLoader
#pragma mark - 请求数据
- (void)startDownloadDataWithDic:(NSDictionary *)dictionary{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"===Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        
        
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
//    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:BaseURL parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"file://path/to/image.jpg"] name:@"file" fileName:@"filename.jpg" mimeType:@"image/jpeg" error:nil];
//    } error:nil];
    
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session POST:BaseURL parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

//        NSString *jsonStr = [NSString stringWithFormat:@"%@", responseObject];
//        //
//                NSData *data = [[NSData alloc] initWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSLog(@"%@",dic);

        if (dic != nil && [[dic objectForKey:@"code"] integerValue] == 0)
        {
            NSArray *array = [dic objectForKey:@"results"];
            if ([self.delegate respondsToSelector:@selector(dataSuccess:withArray:)])
            {
                [_delegate dataSuccess:self withArray:array];
            }
         }else
        {
            
        }
        
        
//        NSLog(@"%@",array);

    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
//    [session POST:BaseURL parameters:dictionary progress:^(NSProgress * _Nonnull uploadProgress)
//    {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
    
    
//    NSURLSessionDataTask *dataTask;
//    dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)
//    {
//        NSString *jsonStr = [NSString stringWithFormat:@"%@", responseObject];
//
////        NSData *data = [[NSData alloc] initWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
//        //                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//    }];
    
//    NSURLSessionUploadTask *uploadTask;
//    uploadTask = [manager
//                  uploadTaskWithStreamedRequest:request
//                  progress:^(NSProgress * _Nonnull uploadProgress) {
//                      // This is not called back on the main queue.
//                      // You are responsible for dispatching to the main queue for UI updates
//                      dispatch_async(dispatch_get_main_queue(), ^{
//                          //Update the progress view
////                          [progressView setProgress:uploadProgress.fractionCompleted];
//                      });
//                  }
//                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//                      if (error) {
//                          NSLog(@"Error: %@", error);
//                      } else {
//                          NSLog(@"%@ %@", response, responseObject);
//                      }
//                  }];
//    
//    [uploadTask resume];
    
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
//    
//    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//    manager.requestSerializer.timeoutInterval = 10.0f;
//    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
//    
//    [manager.operationQueue cancelAllOperations];
//    
//    [manager POST:UCheWeiBaseURL parameters:dictionary
//          success:^(AFHTTPRequestOperation *operation, id responseObject) {
//              
//                NSString *jsonStr = [NSString stringWithFormat:@"%@", operation.responseString];
//                NSData *data = [[NSData alloc] initWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
//                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//              
//                if ([[dic objectForKey:@"code"] integerValue] == 0 && ( dic != nil) && [[dic objectForKey:@"code"] length] <= 4 )
//                {
//                    //成功请求到数据
//                    
//                    NSDictionary *diccc = [dic objectForKey:@"result"];
//                    
//                    if ([self.delegate respondsToSelector:@selector(dataDownLoadSuccess:withDic:)])
//                    {
//                        [_delegate dataDownLoadSuccess:self withDic:diccc];
//                    }
//                    
//                } else
//                {
//                    //请求数据失败，各种错误
//                    if ([self.delegate respondsToSelector:@selector(dataDownLoadOther:withDic:)])
//                    {
//                        [_delegate dataDownLoadOther:self withDic:dic];
//                    }
//                }
//              if ([[dic objectForKey:@"code"] integerValue] == 1005)
//              {
//                  //如果是token 失效
//                  [[NSNotificationCenter defaultCenter]postNotificationName:@"Login" object:nil];
//              }
//              // 取消请求
//              [manager.operationQueue cancelAllOperations];
//              
//          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//              
//              if ([self.delegate respondsToSelector:@selector(dataDownLoadFailed:withError:)]) {
//                  [_delegate dataDownLoadFailed:self withError:[NSString stringWithFormat:@"%@", error.localizedDescription]];
//              }
//              [manager.operationQueue cancelAllOperations];
//          }
//     ];
}
//#pragma - mark 上传数据
//- (void)startUploadDataWithDic:(NSDictionary *)dictionary withData:(NSData *)imageData1 otherData:(NSData *)imageData2{
//    
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
//    //设置超时时间 不管用
//    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//    manager.requestSerializer.timeoutInterval = 10.0f;
//    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
//    
//    [manager POST:UCheWeiBaseURL parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        if (imageData2 == nil) {
//            [formData appendPartWithFileData:imageData1 name:@"userAvatar" fileName:@"userAvatar.png" mimeType:@"image/png"];
//
//        }else
//        {
//            [formData appendPartWithFileData:imageData1 name:@"file0" fileName:@"file0.png" mimeType:@"image/png"];
//            [formData appendPartWithFileData:imageData2 name:@"file1" fileName:@"file1.png" mimeType:@"image/png"];
//        }
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString *jsonStr = [NSString stringWithFormat:@"%@", operation.responseString];
//        NSData *data = [[NSData alloc] initWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"=|=|=%@",dic);
//        NSDictionary *diccc = [dic objectForKey:@"result"];
//
//        if ([[dic objectForKey:@"code"] intValue]==0)
//        {
//            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
//            [keyWindow addSubview:hud];
//            hud.mode = MBProgressHUDModeText;
//            hud.labelText = [dic objectForKey:@"msg"];
//            hud.margin = 10.f;
//            hud.removeFromSuperViewOnHide = YES;
//            [hud hide:YES afterDelay:0.4];
//            
//            if ([self.delegate respondsToSelector:@selector(dataUploadSuccess:withDic:)]) {
//                [_delegate dataUploadSuccess:self withDic:diccc];
//            }
//            
//        }else
//        {
//            if ([self.delegate respondsToSelector:@selector(dataUploadOther:withDic:)]) {
//                [_delegate dataUploadOther:self withDic:diccc];
//            }
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
//        [keyWindow addSubview:hud];
//        hud.mode = MBProgressHUDModeText;
//        hud.labelText = @"请求超时 或者 网络连接错误";
//        hud.margin = 10.f;
//        hud.removeFromSuperViewOnHide = YES;
//        [hud hide:YES afterDelay:0.4];
//        
//        if ([self.delegate respondsToSelector:@selector(dataUploadFailed:withError:)]) {
//            [_delegate dataUploadFailed:self withError:[NSString stringWithFormat:@"%@",error.localizedDescription]];
//        }
//        
////        UIWindow *keyWindow2 = [UIApplication sharedApplication].keyWindow;
////        MBProgressHUD *hud2 = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
////        [keyWindow2 addSubview:hud2];
////        hud2.mode = MBProgressHUDModeText;
////        hud2.labelText =[NSString stringWithFormat:@"错误:%@",error.localizedDescription];
////        hud2.margin = 10.f;
////        hud2.removeFromSuperViewOnHide = YES;
////        [hud2 hide:YES afterDelay:0.4];
//        
//        [manager.operationQueue cancelAllOperations];
//    }];
//
//}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}


@synthesize tag;


@end
