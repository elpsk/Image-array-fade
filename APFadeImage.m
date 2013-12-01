//
//  APFadeImage.m
//  Test
//
//  Created by Alberto Pasca on 22/10/13.
//  Copyright (c) 2013 albertopasca.it. All rights reserved.
//

#import "APFadeImage.h"


@interface APFadeImage ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, copy) NSArray *images;

@end


@implementation APFadeImage

- (id) initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self)
	{
    self.images = @[[UIImage imageNamed:@"A.jpg"],
                    [UIImage imageNamed:@"B.jpg"],
                    [UIImage imageNamed:@"C.jpg"],
                    [UIImage imageNamed:@"D.jpg"]];
		
		[ NSTimer scheduledTimerWithTimeInterval:4.0
																			target:self
																		selector:@selector(switchImage)
																		userInfo:nil
																		 repeats:YES];
	}
	return self;
}

- (void) switchImage
{
	CATransition *transition = [CATransition animation];
	transition.type = kCATransitionFade;
	transition.duration = 2;
	
	[self.imageView.layer addAnimation:transition forKey:nil];
	
	UIImage *currentImage = self.imageView.image;
	NSUInteger index = [self.images indexOfObject:currentImage];
	index = (index + 1) % [self.images count];

	self.imageView.image = self.images[index];
}



@end



