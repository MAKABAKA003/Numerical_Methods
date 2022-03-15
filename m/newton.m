function [p,err,k,y]=newton(f,df,p0,delta,epsilon,max1,M)% M�ظ�����µ�ţ�ٵ�����
%�������:   fΪԭ����
%           dfΪf��һ�׵�����
%           p0Ϊ��ʼֵ
%           deltaΪp������������
%           epsilonΪ����ֵf(p)������������
%           max1Ϊ����������
%           MΪ���Ľ���
%�������:  pΪ��������
%           errΪp��ʵ�����
%           kΪ��������
%           yΪf(p)
for k=1:max1
    p1=p0-M*feval(f,p0)/feval(df,p0);
    err(k)=abs(p0-p1);
    relerr=2*err/(abs(p1)+delta);%������
    p(k)=p1;
    p0=p1;
    y(k)=feval(f,p0);
    if(err(k)<delta)|(relerr<delta)|(abs(y(k))<epsilon)
        break;
    end
end