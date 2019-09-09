//
//  NetworkingObject.h
//  move
//
//  Created by Noverio Joe on 09/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkingObject : NSObject
+(NetworkingObject*)sharedManager;
-(void)performRequestGetWithAction : (NSString*)actionMethod requestData : (NSString*)data onCompleted : (void (^)(id))onPerformWithUrlFinish;
@end

NS_ASSUME_NONNULL_END
