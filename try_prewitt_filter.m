clear; clc;
a = imread('alpaca.jpg');
a = rgb2gray(a);

b = double(a);
ax(1,1) = 0;
hi = 2;
hj = 2;

% just change value in HDy and HDx you will get another filter
% for example, if you want to apply the sobel filter,
% HDy = [-1 -2 -1; 0 0 0; 1 2 1];
% HDx = [-1 0 1; -2 0 2; -1 0 1];

% this value is prewitt filter
HDy = [-1 -1 -1;0 0 0; 1 1 1];
HDx = [-1 0 1;-1 0 1; -1 0 1];
for i = 1:size(a,1)
    for j = 1:size(a,2)
        if i == 1
            if j == 1
                ax(i,j) = (b(i,j)*HDx(hi,hj)) + b(i,j+1)*HDx(hi,hj+1) + ...
                    (b(i+1,j)*HDx(hi+1,hj)) + (b(i+1,j+1)*HDx(hi+1,hj+1));
            elseif j > 1 && j < size(a,2)
                store = (b(i,j-1:j+1).*HDx(hi,hj-1:hj+1));
                store2= (b(i+1,j-1:j+1).*HDx(hi+1,hj-1:hj+1));
                total = store + store2;
                ax(i,j) = total(1,1) + total(1,2) +total(1,3);
            elseif j == size(a,2)
                ax(i,j) = (b(i,j)*HDx(hi,hj)) + b(i,j-1)*HDx(hi,hj-1) + ...
                    (b(i+1,j)*HDx(hi+1,hj)) + (b(i+1,j-1)*HDx(hi+1,hj-1));
            end
        elseif i > 1 && i < size(a,1)
            if j == 1
                store = (b(i-1:i+1,j).*HDx(hi-1:hi+1,hj));
                store2= (b(i-1:i+1,j+1).*HDx(hi-1:hi+1,hj+1));
                total = store + store2;
                ax(i,j) = total(1,1) + total(2,1) +total(3,1);
            elseif j > 1 && j < size(a,2)
                store = (b(i-1:i+1,j).*HDx(hi-1:hi+1,hj));
                store2= (b(i-1:i+1,j+1).*HDx(hi-1:hi+1,hj+1));
                store3= (b(i-1:i+1,j-1).*HDx(hi-1:hi+1,hj-1));
                total = store + store2 + store3;
                ax(i,j) = total(1,1) + total(2,1) +total(3,1);
            elseif j == size(a,2)
                store = (b(i-1:i+1,j).*HDx(hi-1:hi+1,hj));
                store2= (b(i-1:i+1,j-1).*HDx(hi-1:hi+1,hj-1));
                total = store + store2;
                ax(i,j) = total(1,1) + total(2,1) +total(3,1);
            end
        elseif i == size(a,1)
            if j == 1
                ax(i,j) = (b(i,j)*HDx(hi,hj)) + b(i,j+1)*HDx(hi,hj+1) + ...
                    (b(i-1,j)*HDx(hi-1,hj)) + (b(i-1,j+1)*HDx(hi-1,hj+1));
            elseif j > 1 && j < size(a,2)
                store = (b(i,j-1:j+1).*HDx(hi,hj-1:hj+1));
                store2= (b(i-1,j-1:j+1).*HDx(hi-1,hj-1:hj+1));
                total = store + store2;
                ax(i,j) = total(1,1) + total(1,2) +total(1,3);
            elseif j == size(a,2)
                ax(i,j) = (b(i,j)*HDx(hi,hj)) + b(i,j-1)*HDx(hi,hj-1) + ...
                    (b(i-1,j)*HDx(hi-1,hj)) + (b(i-1,j-1)*HDx(hi-1,hj-1));
            end
        end
    end
end


for i = 1:size(a,1)
    for j = 1:size(a,2)
        if i == 1
            if j == 1
                ay(i,j) = (b(i,j)*HDy(hi,hj)) + b(i,j+1)*HDy(hi,hj+1) + ...
                    (b(i+1,j)*HDy(hi+1,hj)) + (b(i+1,j+1)*HDy(hi+1,hj+1));
            elseif j > 1 && j < size(a,2)
                store = (b(i,j-1:j+1).*HDy(hi,hj-1:hj+1));
                store2= (b(i+1,j-1:j+1).*HDy(hi+1,hj-1:hj+1));
                total = store + store2;
                ay(i,j) = total(1,1) + total(1,2) +total(1,3);
            elseif j == size(a,2)
                ay(i,j) = (b(i,j)*HDy(hi,hj)) + b(i,j-1)*HDy(hi,hj-1) + ...
                    (b(i+1,j)*HDy(hi+1,hj)) + (b(i+1,j-1)*HDy(hi+1,hj-1));
            end
        elseif i > 1 && i < size(a,1)
            if j == 1
                store = (b(i-1:i+1,j).*HDy(hi-1:hi+1,hj));
                store2= (b(i-1:i+1,j+1).*HDy(hi-1:hi+1,hj+1));
                total = store + store2;
                ay(i,j) = total(1,1) + total(2,1) +total(3,1);
            elseif j > 1 && j < size(a,2)
                store = (b(i-1:i+1,j).*HDy(hi-1:hi+1,hj));
                store2= (b(i-1:i+1,j+1).*HDy(hi-1:hi+1,hj+1));
                store3= (b(i-1:i+1,j-1).*HDy(hi-1:hi+1,hj-1));
                total = store + store2 + store3;
                ay(i,j) = total(1,1) + total(2,1) +total(3,1);
            elseif j == size(a,2)
                store = (b(i-1:i+1,j).*HDy(hi-1:hi+1,hj));
                store2= (b(i-1:i+1,j-1).*HDy(hi-1:hi+1,hj-1));
                total = store + store2;
                ay(i,j) = total(1,1) + total(2,1) +total(3,1);
            end
        elseif i == size(a,1)
            if j == 1
                ay(i,j) = (b(i,j)*HDy(hi,hj)) + b(i,j+1)*HDy(hi,hj+1) + ...
                    (b(i-1,j)*HDy(hi-1,hj)) + (b(i-1,j+1)*HDy(hi-1,hj+1));
            elseif j > 1 && j < size(a,2)
                store = (b(i,j-1:j+1).*HDy(hi,hj-1:hj+1));
                store2= (b(i-1,j-1:j+1).*HDy(hi-1,hj-1:hj+1));
                total = store + store2;
                ay(i,j) = total(1,1) + total(1,2) +total(1,3);
            elseif j == size(a,2)
                ay(i,j) = (b(i,j)*HDy(hi,hj)) + b(i,j-1)*HDy(hi,hj-1) + ...
                    (b(i-1,j)*HDy(hi-1,hj)) + (b(i-1,j-1)*HDy(hi-1,hj-1));
            end
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