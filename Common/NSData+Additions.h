//
//  NSData+Additions.h
//  Two Factor Authenticator
//
//  Created by Jingsi Zhu on 6/17/14.
//
//

#import <Foundation/Foundation.h>

@interface NSData (Additions)

+ (id)dataWithBase64String:(NSString *)base64String;

@end
