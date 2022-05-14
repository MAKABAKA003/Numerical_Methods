% newton.m
function [p,k,err,y]=newton(f,p0,delta,epsilon,max1,M)% M�ظ�����µ�ţ�ٵ�����
%�������:   fΪԭ����
%           p0Ϊ��ʼֵ
%           deltaΪp������������
%           epsilonΪ����ֵf(p)������������
%           max1Ϊ����������
%           MΪ���Ľ���
%�������:  pΪ��������
%           errΪp��ʵ�����
%           kΪ��������
%           yΪf(p)
syms x;
g=f(x);
df=diff(f,x);
for k=1:max1
    p1=p0-M*feval(f,p0)/double(subs(df,x,p0));
    err(k)=abs(p0-p1);
    relerr=2*err/(abs(p1)+delta);%������
    p(k)=p1;
    p0=p1;
    y(k)=feval(f,p0);
    if(err(k)<delta)|(relerr<delta)|(abs(y(k))<epsilon)
        break;
    end
end
p=p';