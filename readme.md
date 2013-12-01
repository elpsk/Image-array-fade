## Easy image fade


Implementation of kCATransitionFade to fade an array of images.
Very easy using CATransition animation.


```
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
```


Full article here: http://www.albertopasca.it/whiletrue/2013/10/objectivec-simple-uiimage-fade/


