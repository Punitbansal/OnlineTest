//
//  CustomCells.h
//  AskMe
//
//  Created by Punit Bansal on 26/10/15.
//  Copyright © 2015 ios dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupItem;

@interface SingleItemCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView * mainImageView;

@end

@interface MultiItemCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView * collectionView;
@property (nonatomic, weak) GroupItem * groupItem;

@end

@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView * mainImageView;
@property (nonatomic, strong) IBOutlet UILabel * label;

@end

@interface MultiItemLargeCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) IBOutlet UIPageControl * pageControl;
@property (nonatomic, strong) IBOutlet UICollectionView * collectionView;
@property (nonatomic, weak) GroupItem * groupItem;

@end

@interface LargeCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView * mainImageView;

@end

