% tic;
% disp('Esperando...');
% pause(5);
% t=tic;
% disp(t);
% pause(2);
% k=toc;
% disp(k);

% z =clock;
% pause(4);
% disp(etime(clock, z));
% pause(6);
% disp(etime(clock,z));

% A= [21 22 23 24 25 26 0; 27 28 29 210 211 212 0];
% row = A(1,:);
% ini = find(23.56>row);
% [r,c] = size(ini);
% x= ini(c-1);

% A = [1 2 3 4 5; 11 22 33 44 55]
% A = circshift(A, [0, -1])
% A = A(:,1:end-1);
% disp(A);

% for i=1:15
%     if i == 8
%         disp('BREAK');
%         break;
%     end
%     disp(i);
% end


% A = [1,2,3,4,5,6;1,2,3,4,5,6];
% B = [0;0];
% 
% disp(A);
% 
% A = [A(:,1:2), B, A(:, 3:end)];
% 
% disp(A);
% 
res = [1,2,3,4,5,6;1,2,3,4,5,6];
intro = [19;20];
arrow = 2;
res = [res(:,1:arrow), intro, res(:,arrow+1:end)];
disp(res);
