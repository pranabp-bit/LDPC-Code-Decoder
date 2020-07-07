#include <iostream>
#include <bits/stdc++.h>
using namespace std;

int main() {
	cout<<"//Inputs from PE (x,y) in order => PE (1,1), PE(2,1),  PE(3,1)...\n //PE(x,y) has to be mapped to same CNU\n //here, map PE(x,y) with same y to same group of 6 outputs"<<endl;
    map<pair<int, int>, int> input_index;
    int i,j,index=0,group[6]={30,24,18,12,6,0};
    for(i=1;i<7;i++){
        for(j=1;j<7;j++){
            input_index[{ j,i }] = index++; 
            cout<<"assign data_out["<<input_index[{ j,i }]<<"] = data_in["<<(group[i-1]++)<<"];"<<endl;
        }
    }
    
	return 0;
}
