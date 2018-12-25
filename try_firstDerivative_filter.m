clear; clc;
a = imread('alpaca.jpg');
a = rgb2gray(a);
Is = edge(a, 'Sobel');
Ip = edge(a, 'Prewitt');
Ic = edge(a, 'Canny');
subplot(1,3,1); imshow(Is); title('Sobel');
subplot(1,3,2); imshow(Ip); title('Prewitt');
subplot(1,3,3); imshow(Ic); title('Canny');

b = double(a);

HDx = [-5 0 5];
for i = 1:size(a,1)
    for j = 1:size(a,2)
        if j == 1
            ax(i,j) = (b(i,j)*HDx(1,2)) + (b(i,j+1)*HDx(1,3));
        elseif j == size(a,2)
            ax(i,j) = (b(i,j-1)*HDx(1,1)) + (b(i,j)*HDx(1,2));
        else
            ax(i,j) = (b(i,j-1)*HDx(1,1)) + (b(i,j)*HDx(1,2)) + (b(i,j+1)*HDx(1,3));
        end
    end
end
HDy = [-5; 0; 5];
for i = 1:size(a,1)
    for j = 1:size(a,2)
        if i == 1
            ay(i,j) = (b(i,j)*HDy(2,1)) + (b(i+1,j)*HDy(3,1));
        elseif i == size(a,1)
            ay(i,j) = (b(i-1,j)*HDy(1,1)) + (b(i,j)*HDy(2,1));
        else
            ay(i,j) = (b(i-1,j)*HDy(1,1)) + (b(i,j)*HDy(2,1)) + (b(i+1,j)*HDy(3,1));
        end
    end
end

for i = 1:size(a,1)
    for j = 1:size(a,2)
        A(i,j) = (sqrt(ax(i,j)^2 + ay(i,j)^2));
    end
end

B = uint8(A);
figure;
subplot(1,2,1);imshow(A); title('double')
subplot(1,2,2);imshow(B); title('uint8')