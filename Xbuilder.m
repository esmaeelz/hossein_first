clc
clear all
close all
%%
load('SpeedProfile.mat')

% %Define window 
% wx=5;%#of locations it takes
% wt=6;%#of times it takes
% %make array inluding all windows
% B=0;
% [sizex,sizet]=size(A);
% 
% for i=1:sizex-wx+1
%     for j=1:sizet-wt+1
%         for k=1:wx
%         B=[B A(i+k-1,j:j+wt-1)];
%         end
%     end
% end
% B=B(:,2:end);


%Define window
wx=3; % #of locations it takes
wt=2; % #of times it takes
C=zeros(1,wx*wt);
D=zeros(1,wx*wt);
for dd=1:2
    A=speedContours(:,:,dd);%(89:loc , 180:time, day)
   
    %make array inluding all windows
    B=0;
    
    [sizex,sizet]=size(A);
    
    for i=1:sizex-wx+1
        for j=1:sizet-wt+1
            B=0;
            for k =i:i+wx-1
                B=[B A(k,j:j+wt-1)];
            end
            B=B(:,2:end);
            C=[C;B];
        end
    end
    C=C(2:end,:);
    D=[D ;C];
    C=zeros(1,wx*wt);
    
end
D=D(2:end,:);