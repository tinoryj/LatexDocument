//
//  main.cpp
//  training-1
//
//  Created by tinoryj on 2017/7/11.
//  Copyright © 2017年 tinoryj. All rights reserved.
//

#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <istream>
#include <ostream>
#include <cmath>
#include <vector>
#include <deque>
#include <string>
#include <cstring>
#include <sys/time.h>
#define LEN 1803
using namespace std;

int main(int argc, const char * argv[]) {

    struct timeval start, end; //run time count
    gettimeofday(&start, NULL);
    ifstream x("/Users/tinoryj/Documents/Works/组织-竞赛-瞎搞/数学建模/2017国赛/暑假集训第一阶段/练习题/xx2");
    ifstream z("/Users/tinoryj/Documents/Works/组织-竞赛-瞎搞/数学建模/2017国赛/暑假集训第一阶段/练习题/zz2");
    
    double xData[LEN], zData[LEN];
    
    if(x.is_open() && z.is_open()) {
        
        for(int i = 0; i < LEN; i++) {
            
            x>>xData[i];
            z>>zData[i];
        }
    }
    
    long double sum = 0.0;
    
    for (int i = 0; i < LEN; i++) {
        
        for (int j = i + 1; j < LEN; j++) {
            
            sum += sqrt((xData[j]-xData[i]) * (xData[j]-xData[i]) + (zData[j] - zData[i]) * (zData[j] - zData[i]));
        }
    }
    
    cout<<"plan 2: "<<fixed<<sum<<endl;
    gettimeofday(&end, NULL);
    cout<<"time spend: "<<end.tv_usec - start.tv_usec<<"us"<<endl;
}
