//
//  TokenEntry.m
//  Two Factor Authenticator
//
//  Created by Jingsi Zhu on 6/17/14.
//
//

#import "TokenEntry.h"
#import "NSData+Additions.h"
#import <CommonCrypto/CommonCrypto.h>
#import "TOTPGenerator.h"

@implementation TokenEntry {
    TOTPGenerator *_generator;
}

- (void)parseFromURL:(NSURL*)url {
    _generator = nil;

    _type = url.scheme;
    NSString *host = [url.host stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSUInteger location = [host rangeOfString:@":"].location;
    if (location == NSNotFound) {
        _accountName = host;
    } else {
        _issuer = [host substringToIndex:location];
        _accountName = [host substringFromIndex:location + 1];
    }

    NSMutableDictionary *queryString = [[NSMutableDictionary alloc] init];
    for (NSString *qs in [url.query componentsSeparatedByString:@"&"]) {
        NSArray *components = [qs componentsSeparatedByString:@"="];
        [queryString setValue:[[[components objectAtIndex:1]
                                   stringByReplacingOccurrencesOfString:@"+" withString:@" "]
                                  stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
                          forKey:[components objectAtIndex:0]];
    }
    _secret = [NSData dataWithBase64String:[queryString objectForKey:@"secret"]];

    _digits = [[queryString objectForKey:@"digits"] intValue];
    _counter = [[queryString objectForKey:@"counter"] intValue];
    _period = [[queryString objectForKey:@"period"] intValue];

    _issuer = [queryString objectForKey:@"issuer"];
    _algorithm = [queryString objectForKey:@"algorithm"];
}

- (NSString*)token {
    if (_generator == nil) {
        NSString *algorithm = _algorithm ?: @"SHA1";
        NSUInteger digits = _digits ?: 6;
        NSUInteger period = _period ?: 30;

        _generator = [[TOTPGenerator alloc] initWithSecret:_secret algorithm:algorithm digits:digits period:period];
    }
    return [_generator generateOTP];
}



@end
