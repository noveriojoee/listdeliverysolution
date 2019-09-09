//
//  NetworkingObject.m
//  move
//
//  Created by Noverio Joe on 09/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

#import "NetworkingObject.h"
#import <AFNetworking/AFNetworking.h>

@interface NetworkingObject()
@property NSArray<NSString*> *listBypassedUrl;
@end

@implementation NetworkingObject
-(id)init {
    if ( self = [super init] ) {
        self.listBypassedUrl = @[@"https://10.225.16.219",@"https://103.247.182.125"];
    }
    return self;
}

-(BOOL)checkByPassHTTPSWithUrl : (NSString*)url{
    BOOL returnValue = NO;
    for (NSString* value in self.listBypassedUrl) {
        if ([url containsString:value]){
            returnValue = YES;
        }
    }
    return returnValue;
}

+ (NetworkingObject*)sharedManager {
    static NetworkingObject *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(void)performRequestGetWithAction : (NSString*)requestUrl requestData : (NSString*)data onCompleted : (void (^)(id))onPerformWithUrlFinish{
    NSURL *URL = [NSURL URLWithString:requestUrl];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    if ([self checkByPassHTTPSWithUrl:requestUrl]){
        AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [policy setValidatesDomainName:NO];
        [policy setAllowInvalidCertificates:YES];
        manager.securityPolicy = policy;
    }
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"UTF-8" forHTTPHeaderField:@"charset"];
    
    [manager GET:[URL absoluteString] parameters:data progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        onPerformWithUrlFinish(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        onPerformWithUrlFinish(@"SYSTEM UNAVAILABLE");
    }];
}

@end
