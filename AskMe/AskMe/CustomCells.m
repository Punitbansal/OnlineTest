//
//  CustomCells.m
//  AskMe
//
//  Created by Punit Bansal on 26/10/15.
//  Copyright © 2015 ios dev. All rights reserved.
//

#import "CustomCells.h"
#import "GroupItem.h"
#import "UIImageView+WebCache.h"
#import "Item.h"

@implementation SingleItemCell

@end

@implementation LargeCollectionViewCell

@end

@implementation MultiItemLargeCell

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    self.pageControl.numberOfPages = self.groupItem.items.count;
    return self.groupItem.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    Item * item = [self.groupItem.items objectAtIndex:indexPath.row];
    
    LargeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LargeCollectionViewCell" forIndexPath:indexPath];
    [cell.mainImageView sd_setImageWithURL:[NSURL URLWithString:item.imageUrl] placeholderImage:nil];
    cell.mainImageView.layer.borderColor = [[UIColor grayColor] CGColor];
    cell.mainImageView.layer.borderWidth = 1.0;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    Item * item = [self.groupItem.items objectAtIndex:indexPath.row];
    NSURL * url = [NSURL URLWithString:item.webUrl];
    if ([[UIApplication sharedApplication] canOpenURL:url])
        [[UIApplication sharedApplication] openURL:url];

}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
{
    if (!decelerate)
    {
        CGFloat pageWidth = self.collectionView.frame.size.width;
        self.pageControl.currentPage = self.collectionView.contentOffset.x / pageWidth;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.collectionView.frame.size.width;
    self.pageControl.currentPage = self.collectionView.contentOffset.x / pageWidth;
}

@end

@implementation CollectionViewCell

@end

@implementation MultiItemCell

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.groupItem.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    Item * item = [self.groupItem.items objectAtIndex:indexPath.row];
    
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    [cell.mainImageView sd_setImageWithURL:[NSURL URLWithString:item.imageUrl] placeholderImage:nil];
    cell.mainImageView.layer.borderColor = [[UIColor grayColor] CGColor];
    cell.mainImageView.layer.borderWidth = 1.0;
    cell.label.text = item.title;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    Item * item = [self.groupItem.items objectAtIndex:indexPath.row];
    NSURL * url = [NSURL URLWithString:item.webUrl];
    if ([[UIApplication sharedApplication] canOpenURL:url])
        [[UIApplication sharedApplication] openURL:url];
    
}

@end