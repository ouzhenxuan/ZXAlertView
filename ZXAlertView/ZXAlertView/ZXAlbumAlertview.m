//
//  ZXAlbumAlertview.m
//  Zagic
//
//  Created by ozx on 2019/5/24.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXAlbumAlertview.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <Photos/Photos.h>

#define AV @"takePhoto"
#define PH @"album"

@interface ZXAlbumAlertview()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
//    void (^takePhotoReturnImageBlock)(UIImage *image);
    void (^returnImageBlock)(UIImage *image);
    
}
@property (nonatomic, strong) UIButton * takePhotoBtn;
@property (nonatomic, strong) UIButton * albumBtn;
@property (nonatomic, strong) UIButton * cancleBtn;
@property (nonatomic,weak) UIView * line;
@property (nonatomic,weak) UIButton * contentView;      ///< 弹窗主控件
@end

@implementation ZXAlbumAlertview

- (instancetype)initWithReturnImageAction:(void (^)(UIImage *image))alunmAction
                           cancleAction:(void (^)(void))cancleAction{
    
    if ([super init]) {
        
        [self setupTheView];
//        takePhotoReturnImageBlock = takePhotoAction;
        
        returnImageBlock = alunmAction;
        WS(weakSelf);
        [_takePhotoBtn addActionBlock:^(UIButton *button) {
            
            [weakSelf takePhotoAction];
        }];
        
        [_albumBtn addActionBlock:^(UIButton *button) {
            
            [weakSelf albumAction];
            
            
//            //初始化UIImagePickerController类
//            UIImagePickerController * picker = [[UIImagePickerController alloc] init];
//            //判断数据来源为相册
//            picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//            //设置代理
//            picker.delegate = weakSelf;
//            //打开相册
//            [weakSelf presentViewController:picker animated:YES completion:nil];
        }];
        
        [_cancleBtn addActionBlock:^(UIButton *button) {
            cancleAction();
            [weakSelf dismiss];
        }];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
}

- (void)clickTheView:(UITapGestureRecognizer *)ges{
    [self dismiss];
}

- (void)setupTheView{
    
    self.view.backgroundColor = ZXCOLOR_TRANSLUCENT;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTheView:)];
                                
    [self.view addGestureRecognizer:tap];
    
    UIButton * contentView = [[UIButton alloc] init];
    [self.view addSubview:contentView];
    self.contentView = contentView;
    self.contentView.backgroundColor = ZXCOLOR_WHITE;
    self.contentView.userInteractionEnabled = YES;
    
    UIButton * takePhotoBtn = [[UIButton alloc] init];
    [takePhotoBtn setTitle:@"拍照" forState:UIControlStateNormal];
    [takePhotoBtn setTitleColor:ZXCOLOR_FONT_333 forState:UIControlStateNormal];
    [self.contentView addSubview:takePhotoBtn];
    self.takePhotoBtn = takePhotoBtn;
    
    UIButton * albumBtn = [[UIButton alloc] init];
    [albumBtn setTitle:@"从手机相册选择" forState:UIControlStateNormal];
    [albumBtn setTitleColor:ZXCOLOR_FONT_333 forState:UIControlStateNormal];
    [self.contentView addSubview:albumBtn];
    self.albumBtn = albumBtn;

    UIView * line = [[UIView alloc] init];
    line.backgroundColor = ZXCOLOR_WHITE_EEE;
    [self.contentView addSubview:line];
    self.line = line;
    
    UIButton * cancleBtn = [[UIButton alloc] init];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancleBtn.backgroundColor = ZXCOLOR_WHITE;
    [cancleBtn setTitleColor:ZXCOLOR_FONT_333 forState:UIControlStateNormal];
    [self.contentView addSubview:cancleBtn];
    self.cancleBtn = cancleBtn;
    
    [self setupLayout];
}

- (void)setupLayout{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(0);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(zx_tabbarHeight + 98);
    }];
    
    [self.takePhotoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(44);
    }];
    
    [self.albumBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.takePhotoBtn.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(44);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.albumBtn.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
    [self.cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
}

- (void)dealloc{
    NSLog(@"-------------------------------------------------------------");
    NSLog(@"Album dealloc");
}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"12");
    }];
}

#pragma mark - 拍照逻辑
- (void)takePhotoAction{
    AVAuthorizationStatus avStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    //  avStatus 的4中类型
    /*
     AVAuthorizationStatusNotDetermined  // 初次调用
     AVAuthorizationStatusRestricted //  禁用
     AVAuthorizationStatusDenied //
     AVAuthorizationStatusAuthorized // 开通权限
     */
    
    // 用户开放相机权限后 判断相机是否可用
    BOOL useable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    if (useable) {
        [self openSuccWith:AV];
    }else{
        [self guideUserOpenAuth];
    }
}

- (void)albumAction{
    PHAuthorizationStatus phStatus = [PHPhotoLibrary authorizationStatus];
    // 同样 phStatus 有4中类型
    /*
     PHAuthorizationStatusNotDetermined = 0
     PHAuthorizationStatusRestricted
     PHAuthorizationStatusDenied
     PHAuthorizationStatusAuthorized
     */
    
    // 判断相册权限
    BOOL useable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    if (useable) {
        [self openSuccWith:PH];
    }else {
        [self guideUserOpenAuth];
    }
    
}

- (void)guideUserOpenAuth{
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请打开访问权限" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:nil];
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 引导用户设置
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
    }];
    [alertC addAction:alertA];
    [alertC addAction:act];
    [self presentViewController:alertC animated:YES completion:nil];
}

// 打开相机/相册
- (void)openSuccWith:(NSString *)flag{
    
    UIImagePickerController *photoPicker = [UIImagePickerController new];
    photoPicker.delegate = self;
    photoPicker.allowsEditing = NO;
    
    if ([flag isEqualToString:AV]) {
        photoPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    }
    if ([flag isEqualToString:PH]) {
        photoPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:photoPicker animated:YES completion:nil];
}

// 压缩图片
- (UIImage *)compressPictureWith:(UIImage *)originnalImage{
    CGFloat ruleWidth = 600;
    if (originnalImage.size.width < ruleWidth) {
        return originnalImage;
    }
    
    CGFloat hight = ruleWidth/originnalImage.size.width * originnalImage.size.height;
    CGRect rect = CGRectMake(0, 0, ruleWidth, hight);
    // 开启图片上下文
    UIGraphicsBeginImageContext(rect.size);
    // 将图片渲染到图片上下文
    [originnalImage drawInRect:rect];
    // 获取图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark - 相册回调
//选择完成回调函数
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获取图片
    UIImage * image;
    // 判断，图片是否允许修改
    if ([picker allowsEditing]){
        //获取用户编辑之后的图像
        image = [info objectForKey:UIImagePickerControllerEditedImage];
    } else {
        // 照片的元数据参数
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    returnImageBlock(image);
    
    WS(weakSelf);
    [picker dismissViewControllerAnimated:YES completion:^{
        [weakSelf dismissViewControllerAnimated:NO completion:nil];
    }];
    
}
//用户取消选择
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
