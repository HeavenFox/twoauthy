//
//  TokenEntry.h
//  Two Factor Authenticator
//
//  Created by Jingsi Zhu on 6/17/14.
//
//

#import <Foundation/Foundation.h>

@interface TokenEntry : NSObject

@property (copy) NSString *issuer;
@property (copy) NSString *accountName;
@property (strong) NSData *secret;
@property (copy) NSString *type;
@property (copy) NSString *algorithm;
@property (assign) NSInteger digits;
@property (assign) NSInteger counter;
@property (assign) NSInteger period;

- (NSString*)token;

@end
