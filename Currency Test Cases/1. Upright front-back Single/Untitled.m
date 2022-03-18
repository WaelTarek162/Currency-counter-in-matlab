%our cuurency 
DSt=[     "0.5-back.jpg" "0.5-Front.jpg" "1-back.jpg" "1-Front.jpg";
          "5-back.jpg" "5-Front.jpg" "10-back.jpg" "10-Front.jpg";
          "20-back.jpg" "20-Front.jpg" "50-back.jpg" "50-Front.jpg";
          "100-back.jpg" "100-Front.jpg" "200-back.jpg" "200-Front.jpg"];     
 %path of tested image
testIMG=imread('E:\Ain Shams Matrials\Term1 Level4\Image Processing\Labs\Projects Description\Currency counter\Currency Test Cases\2. Upright front-back all-in-one none-intersect\all-front-back.jpg');
 % total cach variable  
totalsum=0.0;
% list to detect the banknote category  
flag_list=zeros(4,4);
cash_array=[];
% looping on dataset and match every element with the testsd image 
%in case the features number more than 80 feature the banknote will added to flag list 
for i= 1:4
    for j = 1:4
        I1 = im2gray(testIMG);
        I2 = im2gray(imread(DSt(i,j)));
        points1 = detectHarrisFeatures(I1);
        points2 = detectHarrisFeatures(I2);
        [features1,valid_points1] = extractFeatures(I1,points1);
        [features2,valid_points2] = extractFeatures(I2,points2);
        indexPairs = matchFeatures(features1,features2);       
        features_number=size(indexPairs,1);
       if features_number>=80
           flag_list(i,j)=1;
       end    
       features_number=0;     
    end
end
%looping on the flag matrix to extract the banknote category and collect
%total cach then printing on Command window
for x=1:4
    for y=1:4
        if flag_list(x,y)==1
            if x==1&&(y==1||y==2)
                totalsum=totalsum+0.5;
                continue;
            end
            
            if x==1&&(y==3||y==4)
                totalsum=totalsum+1;
                continue;
            end           
            if x==2&&(y==1||y==2)
                totalsum=totalsum+5;
                continue;
            end           
            if x==2&&(y==3||y==4)
                totalsum=totalsum+10;
                continue;
            end           
             if x==3&&(y==1||y==2)
                totalsum=totalsum+20;
                continue;
            end
            
            if x==3&&(y==3||y==4)
                totalsum=totalsum+50;
                continue;
            end            
             if x==4&&(y==1||y==2)
                totalsum=totalsum+100;
                continue;
             end            
            if x==4&&(y==3||y==4)
                totalsum=totalsum+200;
                continue;
            end
        end
    end
end
disp("total cash = ");
disp(totalsum);
disp(" EGP");
imshow(testIMG);