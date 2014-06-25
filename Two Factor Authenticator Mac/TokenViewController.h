//
//  TokenViewController.h
//  Two Factor Authenticator
//
//  Created by Jingsi Zhu on 6/17/14.
//
//

#import <Cocoa/Cocoa.h>
#import "TokenEntry.h"

@interface TokenViewController : NSViewController
@property (strong) IBOutlet NSTextField *issuerLabel;
@property (strong) IBOutlet NSTextField *tokenLabel;
@property (strong) IBOutlet NSTextField *accountLabel;

@property (nonatomic, strong) TokenEntry *tokenEntry;

@end
