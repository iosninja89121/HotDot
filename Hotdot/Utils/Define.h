//
//  Define.h
//  Hotdot
//
//  Created by administrator on 3/11/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 alpha:1.0]

#define NC_SIGN                             @"SignNavCtrl"
#define NC_MAIN                             @"MainNavCtrl"
#define VC_LOGIN                            @"LoginViewCtrl"
#define VC_SIGNUP                           @"SignupViewCtrl"
#define VC_MAIN                             @"MainViewCtrl"
#define VC_SIDE_MENU                        @"SideMenuViewCtrl"
#define VC_ACTIVITY                         @"ActivityViewCtrl"
#define VC_FEED                             @"FeedViewCtrl"
#define VC_COLLABORATION                    @"CollaborationViewCtrl"
#define VC_PROFILE                          @"ProfileViewCtrl"
#define VC_CAMERA                           @"CameraViewCtrl"
#define VC_CREATE_POST                      @"CreatePostViewCtrl"
#define VC_POST                             @"PostViewCtrl"
#define VC_OVERVIEW                         @"OverviewViewCtrl"
#define VC_CREDENTIALS                      @"CredentialsViewCtrl"
#define VC_PORTFOLIO                        @"PortfolioViewCtrl"
#define VC_PORTFOLIO_DETAIL                 @"PortfolioDetailViewCtrl"
#define VC_CHAT                             @"ChatViewCtrl"
#define VC_FILES                            @"FilesViewCtrl"
#define VC_FILES_DETAIL                     @"FilesDetailViewCtrl"
#define VC_TEAM                             @"TeamViewCtrl"
#define VC_TEAM_EDIT                        @"TeamEditViewCtrl"
#define VC_NEW_COLLABORATION                @"NewCollaborationViewCtrl"
#define VC_CHOOSE_FRIEND                    @"ChooseFriendViewCtrl"
#define VC_NEW_COLLABORATION_OTHER          @"NewCollaborationOtherViewCtrl"

#define CELL_ACTIVITY_COMMENT               @"CommentCell"
#define CELL_ACTIVITY_LIKE                  @"LikeCell"
#define CELL_ACTIVITY_FRIEND                @"FriendCell"
#define CELL_FEED                           @"FeedCell"
#define CELL_COLLABORATION                  @"CollaborationCell"
#define CELL_PORTFOLIO                      @"PortfolioCell"
#define CELL_TEAM                           @"TeamCell"
#define CELL_FRIEND                         @"FriendCell"

#define ACTIVITY_COMMENT                    @"comment"
#define ACTIVITY_LIKE                       @"like"
#define ACTIVITY_FRIEND                     @"friend"

#define KEY_ACTIVITY_MODE                   @"mode"
#define KEY_ACTIVITY_NAME                   @"name"
#define KEY_ACTIVITY_TIME                   @"time"
#define KEY_ACTIVITY_AVATAR                 @"avatar"
#define KEY_ACTIVITY_IMAGE                  @"image"
#define KEY_FEED_NAME                       @"name"
#define KEY_FEED_TIME                       @"time"
#define KEY_FEED_AVATAR                     @"avatar"
#define KEY_FEED_IMAGE                      @"image"
#define KEY_FEED_TEXT                       @"text"
#define KEY_FEED_COMMENTS                   @"comments"
#define KEY_FEED_LIKES                      @"likes"
#define KEY_COLLABORATE_TITLE               @"title"
#define KEY_COLLABORATE_INFO                @"info"
#define KEY_COLLABORATE_AVATAR              @"avatar"
#define KEY_COLLABORATE_TIME                @"1 day"


#endif /* Define_h */
