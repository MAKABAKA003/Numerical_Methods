function [p0,err,k,y]=newton(f,df,p0,delta,epsilon,max1,M)%M�ظ�����µ�ţ�ٵ�����
%�������:   fΪԭ����
%           dfΪf��һ�׵�����
%           p0Ϊ��ʼֵ
%           deltaΪp������������
%           epsilonΪ����ֵf(p)������������
%           max1Ϊ����������
%           MΪ���Ľ���
%�������:  p0Ϊ�������
%           errΪp0��ʵ�����
%           kΪ��������
%           yΪf(p0)
for k=1:max1
    p1=p0-M*feval(f,p0)/feval(df,p0);
    err=abs(p0-p1);
    relerr=2*err/(abs(p1)+delta);%������
    p0=p1;
    y=feval(f,p0);
    if(err<delta)|(relerr<delta)|(abs(y)<epsilon)
        break;
    end
end