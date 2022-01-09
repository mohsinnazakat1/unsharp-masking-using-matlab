%Unsharp masking 
A = rgb2gray(imread("abc.png"));

[R,C]=size(A);
B = zeros (R,C);

%Step1: Applying Average Filter for bluring (I'm using 7*7 avg Filter 3*3
%wasn't quite effective)
for i = 4:1:R-3
    for j= 4:1:C-3
        t = A(i-3:i+3,j-3:j+3);
        total = sum(t,'all');
        value = total/49;
        B(i,j)=value;
    end
end

%Step2: Extracting edges by subtracting blured image from orignal image
C = minus (A,uint8(B));

%displaying orignal image
figure; imshow(A); title('Part 1- Orignal Image');

%saving orignal image
imwrite(A,"original_image.bmp");

%displaying blured image
figure; imshow(uint8(B)); title('Part 1- Blurred Image');

%displaying extracted edges
figure; imshow(uint8(C)); title('Part 1- Edges');

%Step3: Addiing edges back to the orignal image to make it sharpen 
A = A+C;

%displaying sharpen image
figure; imshow(A); title('Part 1- Sharpened Image');

%saving sharpen image
imwrite(A,"unsharped_masked_image.jpeg");