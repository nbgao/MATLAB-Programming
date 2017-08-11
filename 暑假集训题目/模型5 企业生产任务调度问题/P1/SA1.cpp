#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <time.h>
#include <algorithm>
#include <cstring>
#include <string>
#include <cmath>

const int INF = 1E9;

using namespace std;

int p[10] = {0,3,4,1,2,6,1,4,7,5};
int d[10] = {0,5,9,3,12,10,24,5,6,6};
int w1[10] = {0,750,1200,800,900,2500,500,3000,5600,4500};
int w2[10] = {0,500,900,400,750,1800,300,1500,4000,2000};
int dw[10];

void cpy(int a[10],int b[10])
{
	for(int i=0;i<=9;i++)
		a[i] = b[i];
}

void Print(int S[])
{
	for(int i=1;i<=9;i++)
		cout<<S[i]<<" ";
	cout<<endl;
}

int sum(int a[])
{
	int s = 0;
	for(int i=1;i<=10;i++)
		s += a[i];
	return s;
}

void Trans(int S_new[10],int S[10])
{
	srand(time(NULL));
	int pos1=rand()%9+1,pos2=rand()%9+1;
	while(pos1 >= pos2)
	{
		pos1 = rand()%9+1;
		pos2 = rand()%9+1;
	}
	
	cpy(S_new,S);
	for(int i=pos1,j=pos2;i<j;i++,j--)
		swap(S_new[i],S_new[j]);	
}

int fun(int S[])
{
	int cur = 0;
	int W = 0;
	
	for(int i=1;i<=9;i++)
	{
		cur += p[S[i]];
		if(cur <= d[S[i]])		//°´ÆÚ 
			W += 0;
		else					//ÓâÆÚ 
			W += dw[S[i]];
	}
	return W;
}

void SA(int S_best[],int S[])
{
	int a = 0.95;
	int t = 100;
	int tf = 1;
	
	int S_cur[10],S_new[10];
	cpy(S_new,S);
	cpy(S_cur,S_new);
	cpy(S_best,S_new);
	
	int E_cur=INF,E_new,E_best=INF;
	
	while(t >= tf)
	{
		Trans(S_new,S);
		E_new = fun(S_new);
		
		if(E_new < E_cur)
		{
			E_cur = E_new;
			cpy(S_cur,S_new);
			if(E_new < E_best)
			{
				E_best = E_new;	
				cpy(S_best,S_new);
			}
		}else{
			srand(time(NULL));
			double pp = (rand()%RAND_MAX)/(double)RAND_MAX;
			
			if(pp < exp(-(E_new-E_cur)/t))
			{
				E_cur = E_new;
				cpy(S_cur,S_new);
			}else{
				cpy(S_new,S_cur);
			}
		}
		t *= a;
		Print(S_cur);
	}
}




int main()
{	
	
	for(int i=1;i<=9;i++)
		dw[i] = w1[i] - w2[i];
	
	int S[10] = {0,2,9,5,1,8,6,7,3,4};
	int S_1[10] = {0,3,9,4,6,8,5,7,2,1}; 
	int S_best[10];
	
	printf("%d - %d = %d\n",sum(w1),fun(S_1),sum(w1)-fun(S_1));
	
	Print(S);
	int S_2[10];
	Trans(S_2,S);
	Print(S_2);
	
	SA(S_best,S);
	Print(S_best);
	
	
	return 0;
}

