//
//  ViewController.m
//  01-AVFondaton_OverView
//
//  Created by Alexcai on 2019/3/15.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self p_speechVoice];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
/** 文字到语音 */
- (void)p_speechVoice{
    NSSpeechSynthesizer *speech = [NSSpeechSynthesizer new];
    [speech startSpeakingString:@"Hello"];
    
}


@end
