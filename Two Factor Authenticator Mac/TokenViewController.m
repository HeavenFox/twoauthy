//
//  TokenViewController.m
//  Two Factor Authenticator
//
//  Created by Jingsi Zhu on 6/17/14.
//
//

#import "TokenViewController.h"

@interface TokenViewController ()

@end

@implementation TokenViewController

- (void)setTokenEntry:(TokenEntry *)tokenEntry {
    _tokenEntry = tokenEntry;
    self.issuerLabel.stringValue = tokenEntry.issuer;
    self.accountLabel.stringValue = tokenEntry.accountName;
    [self updateToken];
}

- (id)init {
    self = [super initWithNibName:@"TokenViewController" bundle:[NSBundle mainBundle]];
    if (self) {

    }
    return self;
}

- (void)updateToken {
    self.tokenLabel.stringValue = [_tokenEntry token];
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Initialization code here.
//    }
//    return self;
//}

@end
