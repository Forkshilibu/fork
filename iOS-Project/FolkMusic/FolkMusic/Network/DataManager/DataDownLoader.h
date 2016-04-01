//
//  DataDownLoader.h
//  UParking
//
//  Created by CheWei on 15/8/24.
//  Copyright (c) 2015年 yu. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol DataDownLoaderDelegate;

@interface DataDownLoader : NSObject

@property (nonatomic, weak)id<DataDownLoaderDelegate> delegate;

@property (nonatomic, assign)NSInteger tag;

- (instancetype)init;
//Creating a Download Task
- (void)startDownloadDataWithDic:(NSDictionary *)dictionary;

//Creating an Upload Task

//- (void)startUploadDataWithDic:(NSDictionary *)dictionary withData:(NSData *)imageData1 otherData:(NSData *)imageData2;
@end


#pragma mark GetDateDelegate
@protocol DataDownLoaderDelegate <NSObject>

//- (void)getDataBack:(NSDictionary *)dic;
@optional
- (void)dataSuccess:(DataDownLoader *)theDataLoader dic:(NSDictionary *)theDic;
- (void)dataFailed:(DataDownLoader *)theDataLoader withError:(NSString *)theError;
- (void)dataOther:(DataDownLoader *)theDataLoader withDic:(NSDictionary *)theDic;//其他情况

//- (void)dataUploadSuccess:(DataDownLoader *)theDataLoader withDic:(NSDictionary *)theDic;
//- (void)dataUploadFailed:(DataDownLoader *)theDataLoader withError:(NSString *)theError;
//- (void)dataUploadOther:(DataDownLoader *)theDataLoader withDic:(NSDictionary *)theDic;

@end