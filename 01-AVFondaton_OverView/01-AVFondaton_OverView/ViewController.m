//
//  ViewController.m
//  01-AVFondaton_OverView
//
//  Created by Alexcai on 2019/3/15.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface ViewController ()

@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, strong) NSArray *players;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.backgroundColor = NSColor.redColor.CGColor;
    // Do any additional setup after loading the view.
    [self p_speechVoice];
    
//
    AVAudioPlayer *p1 = [self playerWithFile:@"comedy"];
    AVAudioPlayer *p2 = [self playerWithFile:@"dada"];
    AVAudioPlayer *p3 = [self playerWithFile:@"tinkling"];
    self.players = @[p1,p2,p3];
}

- (void)viewWillAppear{
    [super viewWillAppear];
    NSLog(@"%s",__func__);
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
#pragma mark - IBAction

- (IBAction)clickedPlay:(NSButton *)sender {
    [self audioPlay];
}

- (IBAction)clickedStop:(NSButton *)sender {
    [self audioStop];
}

#pragma mark -

/** 文字到语音 */
- (void)p_speechVoice{
    NSSpeechSynthesizer *speech = [NSSpeechSynthesizer new];
    /** 设置播放声音 */
    [speech setVoice:@"com.apple.speech.synthesis.voice.sara"];
    NSLog(@"%@",NSSpeechSynthesizer.availableVoices);
    [speech startSpeakingString:@"Hello"];
    
}

- (AVAudioPlayer *)playerWithFile:(NSString *)name{
    NSURL *fileURL = [NSBundle.mainBundle URLForResource:name withExtension:@"mp3"];
    NSError *error = nil;
    AVAudioPlayer *player = [[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:&error];
    if (player) {
        player.numberOfLoops = -1;
        player.enableRate = YES;
//        [player prepareToPlay];
    }
    return player;
}

- (void)audioPlay{
    if (!self.isPlaying) {
        NSTimeInterval delayTime = [self.players[0] deviceCurrentTime] + 0.01;
        for (AVAudioPlayer *p in self.players) {
            [p playAtTime:delayTime];
        }
        self.isPlaying = YES;
    }
}

- (void)audioStop{
    if (self.isPlaying) {
        for (AVAudioPlayer *p in self.players) {
            [p stop];
            p.currentTime = 0;
        }
        self.isPlaying = NO;
    }
}

@end
