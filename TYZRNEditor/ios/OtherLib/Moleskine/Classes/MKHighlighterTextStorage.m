//
// Created by shiweifu on 8/5/15.
// Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKHighlighterTextStorage.h"
#import "MKHighlighterType.h"
#import "MKMarkdownHeaderHighlighter.h"
#import "MKMarkdownLinkHighlighter.h"
#import "MKMarkdownStrikethroughHighlighter.h"
#import "MKMarkdownListHighlighter.h"
#import "MKMarkdownOrderListHighlighter.h"
#import "MKMarkdownCodeBlockHighlighter.h"
#import "MKMarkdownInlineBlockHighlighter.h"
#import "MKMarkdownStrongBlockHighlighter.h"
#import "MKMarkdownItalicHighlighter.h"

@interface MKHighlighterTextStorage ()

@property (nonatomic, readwrite) NSMutableAttributedString *backingStore;
@property (nonatomic, strong) NSDictionary   *attributeDictionary;
@property (nonatomic, strong) NSDictionary   *defaultAttributes;
@property (nonatomic, strong) NSDictionary   *bodyFont;
@property (nonatomic, strong) NSMutableArray *highlighters;

@end


@implementation MKHighlighterTextStorage
{
}

-(id)init
{
  self = [super init];
  if (self)
  {
    _backingStore = [NSMutableAttributedString new];
    _bodyFont = @{NSFontAttributeName:[UIFont systemFontOfSize:12],
            NSUnderlineStyleAttributeName:[NSNumber numberWithInt:NSUnderlineStyleNone]};

    MKMarkdownItalicHighlighter *italicHighlighter               = [[MKMarkdownItalicHighlighter alloc] init];
    MKMarkdownHeaderHighlighter *headerHighlighter               = [[MKMarkdownHeaderHighlighter alloc] init];
    MKMarkdownLinkHighlighter *linkHighlighter                   = [[MKMarkdownLinkHighlighter alloc] init];
    MKMarkdownListHighlighter *listHighlighter                   = [[MKMarkdownListHighlighter alloc] init];
    MKMarkdownStrikethroughHighlighter *strikethroughHighlighter = [[MKMarkdownStrikethroughHighlighter alloc] init];
    MKMarkdownOrderListHighlighter *orderListHighlighter         = [[MKMarkdownOrderListHighlighter alloc] init];
    MKMarkdownCodeBlockHighlighter *codeBlockHighlighter         = [[MKMarkdownCodeBlockHighlighter alloc] init];
    MKMarkdownInlineBlockHighlighter *inlineBlockHighlighter     = [[MKMarkdownInlineBlockHighlighter alloc] init];
    MKMarkdownStrongBlockHighlighter *strongBlockHighlighter     = [[MKMarkdownStrongBlockHighlighter alloc] init];

    [self addHighlighter:headerHighlighter];
    [self addHighlighter:linkHighlighter];
    [self addHighlighter:strikethroughHighlighter];
    [self addHighlighter:listHighlighter];
    [self addHighlighter:orderListHighlighter];
    [self addHighlighter:codeBlockHighlighter];
    [self addHighlighter:inlineBlockHighlighter];
    [self addHighlighter:strongBlockHighlighter];
    [self addHighlighter:italicHighlighter];
  }
  return self;
}

- (void)addHighlighter:(id<MKHighlighterTypeProtocol>)highlighter
{
  [self.highlighters addObject:highlighter];
  [self editedAll:NSTextStorageEditedAttributes];
}

- (NSDictionary *)defaultAttributes
{
  if(!_defaultAttributes)
  {
    _defaultAttributes = @{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleBody],};
  }
  return _defaultAttributes;
}

- (NSString *)string
{
  return _backingStore.string;
}

- (NSMutableArray *)highlighters
{
  if(!_highlighters)
  {
    _highlighters = [@[] mutableCopy];
  }
  return _highlighters;
}


- (NSDictionary *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;
{
  return [_backingStore attributesAtIndex:location
                           effectiveRange:range];
}

- (void)replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)str;
{
  [self beginEditing];
  [self.backingStore replaceCharactersInRange:range
                         withAttributedString:str];
  [self edited:NSTextStorageEditedCharacters | NSTextStorageEditedAttributes
         range:range
changeInLength:str.length - range.length];

  [self endEditing];
}

- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range;
{
  [self beginEditing];
  [_backingStore setAttributes:attrs range:range];
  [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
  [self endEditing];
}

- (void)processEditing {
  NSRange r = NSMakeRange(0, self.string.length);
  [self highlightRange:r];
  [super processEditing];
}

-(void)editedAll:(NSTextStorageEditActions) actions
{
  [self edited:actions
         range:NSMakeRange(0, self.backingStore.length)
changeInLength:0];

}

- (void)highlightRange:(NSRange)range
{
  [self.backingStore beginEditing];
//      实施高亮之前，首先恢复默认配色
  [self setAttributes:self.defaultAttributes
                range:range];

  NSMutableAttributedString *attrString = [[self.backingStore attributedSubstringFromRange:range] mutableCopy];

  // 每个 highlighter 对应一个描述样式的属性和正则表达式
  for (int i = 0; i < self.highlighters.count; ++i)
  {
    id<MKHighlighterTypeProtocol> highlighter = self.highlighters[i];
    // 先进行正则表达式匹配，匹配到的内容添加样式
    [highlighter highlightAttributedString:attrString];
  }

  [self replaceCharactersInRange:range
            withAttributedString:attrString];
  [self.backingStore endEditing];
}

@end