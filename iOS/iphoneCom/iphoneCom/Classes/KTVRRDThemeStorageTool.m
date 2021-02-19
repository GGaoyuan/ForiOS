//
//  KTVRRDThemeStorageTool.m
//  iphoneCom
//
//  Created by gaoyuan on 2021/2/2.
//

#import "KTVRRDThemeStorageTool.h"
#import <FMDB.h>

@interface KTVRRDThemeStorageTool()

@property (nonatomic, strong) FMDatabaseQueue *writeQueue;
@property (nonatomic, strong) FMDatabaseQueue *readQueue;

@end

@implementation KTVRRDThemeStorageTool

static KTVRRDThemeStorageTool *_instance;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[KTVRRDThemeStorageTool alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *dbPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"theme.db"];
        NSLog(@"themeDB -- path:%@",dbPath);
        FMDatabase *fmdb = [FMDatabase databaseWithPath:dbPath];
        if([fmdb open]) {
            self.writeQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
            self.readQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
            //初始化数据表
            [self createTables];
            [self appUpdateVersion10_5_0];
            [fmdb close];
        } else {
            NSLog(@"themeDB -- 数据库打开失败---%@", fmdb.lastErrorMessage);
        }
    }
    return self;
}

/// 10.5.0兼容10.4.8的方法
- (void)appUpdateVersion10_5_0 {
    return;
    [self.writeQueue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
        NSString *uid = @"111";
        BOOL infoResult = [db executeUpdate:@"INSERT INTO UserInfo (uid, themeid, probation) VALUES (?,?,?)",uid,@(2),@(0)];
        if (!infoResult) {
            *rollback = YES;
            return;
        }
        BOOL versionResult;
        for (int i = 2; i < 10; i++) {
            versionResult = [db executeUpdate:@"INSERT INTO ThemeVersion (uid, themeid, version) VALUES (?,?,?)",uid,@(i),@(1)];
            if (!versionResult) {
                *rollback = YES;
                return;
            }
        }
    }];
}

#pragma mark - Tabel
- (void)createTables {
//    [self.writeQueue inDatabase:^(FMDatabase *db) {
//        NSString *drop1 = @"DROP TABLE UserInfo";
//        NSString *drop2 = @"DROP TABLE ThemeVersion";
//        [db executeUpdate:drop1];
//        [db executeUpdate:drop2];
//    }];
    
    [self.writeQueue inDatabase:^(FMDatabase *db) {
        NSString *createUserInfoSQL = @"CREATE TABLE IF NOT EXISTS UserInfo (id integer PRIMARY KEY AUTOINCREMENT, uid text NOT NULL, themeid integer NOT NULL, probation integer NOT NULL);";
        BOOL userResult = [db executeUpdate:createUserInfoSQL];
        if (!userResult) {
            NSLog(@"themeDB -- UserInfo创建失败---%@",db.lastErrorMessage);
        }
        NSString *createVersionSQL  = @"CREATE TABLE IF NOT EXISTS ThemeVersion (id integer PRIMARY KEY AUTOINCREMENT, uid text NOT NULL, themeid integer NOT NULL, version double NOT NULL);";
        BOOL versionResult = [db executeUpdate:createVersionSQL];
        if (!versionResult) {
            NSLog(@"themeDB -- version创建失败---%@",db.lastErrorMessage);
        }
    }];
}

#pragma mark - SQL
- (NSArray *)fetchThemeVersions {
    __block NSMutableArray *versoins = [NSMutableArray array];
    BOOL a = [self.writeQueue openFlags];
    NSLog(@"");
    [self.readQueue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *set = [db executeQuery:@"SELECT * FROM ThemeVersion where uid = ?", @"111"];
        while ([set next]) {
            NSLog(@"");
        }
        [set close];
    }];
    return versoins;
}


@end
