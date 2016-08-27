//
//  TDListNodHandel.m
//  TDCommonTools
//
//  Created by 董慧翔 on 16/8/17.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import "TDListNodHandel.h"

@implementation TDListNodHandel





/**
 *  两个升序链表排成一个链表算法
 */

struct ListNode{
    int m_nValue;
    struct ListNode *m_pNext;
};


struct ListNode *Merge(struct ListNode *pHead1,struct ListNode *pHead2){
    if (pHead1 == NULL) {
        return pHead2;
    }
    if (pHead2 == NULL) {
        return pHead1;
    }
    
    struct ListNode *pMergeHead = NULL;
    if (pHead1->m_nValue < pHead2->m_nValue) {
        pMergeHead = pHead1;
        pMergeHead->m_pNext = Merge(pHead1->m_pNext,pHead2);
    }else{
        pMergeHead = pHead2;
        pMergeHead->m_pNext = Merge(pHead1, pHead2->m_pNext);
    }
    return pMergeHead;
}


/**
 *  反转单向链表
 */

struct ListNode *reverseListNode(struct ListNode *phead1){
    
    struct ListNode *pre = NULL;
    struct ListNode *next = NULL;

    while (phead1 != NULL) {
        next = phead1 -> m_pNext;
        phead1 -> m_pNext = pre;
        pre = phead1;
        phead1 = next;
        
    }
    
    return pre;
}


/**
 *  求两个数的最大公约数（欧几里得算法，辗转相除算法）如果q和r分别是m除以n的商及余数，即m=nq+r ，那么m和n 的最大公约数等于 n和r 的最大公约数。
 */

static NSInteger result (NSInteger m,NSInteger n){
    
    return n == 0 ? m : result(n, m%n);
    
}











@end
