//
//  ViewController.m
//  debug-asiapay-sdk
//
//  Created by Sam Chan on 7/9/2022.
//

#import "ViewController.h"
#import <AP_PaySDK/AP_PaySDK.h>
#import <AP_PaySDK/AP_PaySDK-Swift.h>
#import <PassKit/PassKit.h>

@import AP_PaySDK;


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PaySDK *paySDK = [PaySDK shared];
    // Do any additional setup after loading the view.
    paySDK.paymentDetails = [[PayData alloc] initWithChannelType: PayChannelDIRECT
                                                         envType: EnvTypeSANDBOX
                                                          amount: @"8499.0"
                                                          payGate: PayGatePAYDOLLAR
                                                          currCode: CurrencyCodeHKD
                                                          payType: payTypeNORMAL_PAYMENT
                                                          orderRef: @"3_4cf6e22e_010053795"
                                                          payMethod: @"ALIPAYHKAPP"
                                                          lang: LanguageENGLISH
                                                          merchantId: @"YOUR_MERCHANT_ID"
                                                          remark: @""
                                                          payRef: @""
                                                          resultpage: nil
                                                 showCloseButton:false
                                                      showToolbar:false
                                               webViewClosePrompt:@""
                                                        extraData:nil
                                         merchantCapabilitiesData:nil
                                            supportedNetworksData:nil
                             ];
    paySDK.delegate = self;
    [paySDK process];
  }

  - (void)paymentResultWithResult:(PayResult * _Nonnull)result {
    NSLog(@"RCTAsiaPayModule#paymentResultWithResult");
  }

  - (void)payMethodOptionsWithMethod:(PaymentOptionsDetail * _Nonnull)method {
    NSLog(@"RCTAsiaPayModule#payMethodOptionsWithMethod");
  }

  - (void)transQueryResultsWithResult:(TransQueryResults * _Nonnull)result {
    NSLog(@"RCTAsiaPayModule#transQueryResultsWithResult");
  }

  - (void)showProgress {
    NSLog(@"RCTAsiaPayModule#showProgress");
  }

  - (void)hideProgress {
    NSLog(@"RCTAsiaPayModule#hideProgress");
  }
@end
