function [p,err,k,g]=newton(f,p0,delta,epsilon,max1,M)% M�ظ�����µ�ţ�ٵ�����
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
y=f(x);
df=matlabFunction(diff(y,1));
for k=1:max1
    if feval(df,p0)==0
        disp("error:f��һ�׵�����p0��Ϊ0");
        break;
    end
    p1=p0-M*feval(f,p0)/feval(df,p0);
    err(k)=abs(p0-p1);
    relerr=2*err/(abs(p1)+delta);%������
    p(k)=p1;
    p0=p1;
    g(k)=feval(f,p0);
    if(err(k)<delta)|(relerr<delta)|(abs(g(k))<epsilon)
        break;
    end
end