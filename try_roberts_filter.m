clear; clc;
a = imread('alpaca.jpg');
a = rgb2gray(a);
b = double(a);
h1i = 1;
hj = 2;
h2i = 2;
HR1 = [0 5; -5 0];
HR2 = [-5 0; 0 5];

for i = 1:size(a,1)
    for j = 1:size(a,2)
        if i == 1
            if j == 1
                a1(i,j) = b(i,j)*HR1(h1i,hj) + b(i+1,j)*HR1(h1i+1,hj);
            elseif j > 1
                a1(i,j) = b(i,j)*HR1(h1i,hj) + b(i+1,j-1)*HR1(h1i+1,hj-1);
            end
        elseif i > 1 && i < size(a,1)
            if j == 1
                a1(i,j) = b(i,j)*HR1(h1i,hj);
            elseif j > 1
                a1(i,j) = b(i,j)*HR1(h1i,hj) + b(i+1,j-1)*HR1(h1i+1,hj-1);
            end
        elseif i == size(a,1)
            a1(i,j) = b(i,j)*HR1(h1i,hj);
        end
    end
end

for i = 1:size(a,1)
    for j = 1:size(a,2)
        if i == 1
                a2(i,j) = b(i,j)*HR2(h2i,hj);
        elseif i > 1 
            if j == 1
                a2(i,j) = b(i,j)*HR2(h2i,hj);
            elseif j > 1
                a2(i,j) = b(i,j)*HR2(h2i,hj) + b(i-1,j-1)*HR2(h2i-1,hj-1);
            end
        end
    end
end

for i = 1:size(a,1)
    for j = 1:size(a,2)
        A(i,j) = sqrt(a1(i,j)^2 + a2(i,j)^2);
    end
end
A1 = uint8(a1);
A2 = uint8(a2);

B = uint8(A);
subplot(3,1,1); imshow(a); title('original');
subplot(3,1,2); imshow(A1); title('HR1');
subplot(3,1,3); imshow(A2); title('HR2');
