function CamScanner(Page,RealPage)
%--------------------Finding horizantal lines
line_H = [-1 -1 -1;
          2 2 2;
         -1 -1 -1];
     
H_Page = conv2(Page,line_H);
H_Page_T= H_Page';
[r,c] = size(H_Page);
R = floor(r/2);
H_max = max(max(H_Page(1:R,:)));   
H_row_1 =find(max(H_Page_T)==H_max);
H_max = max(max(H_Page(R+1:end,:)));   
H_row_2 =find(max(H_Page_T)==H_max);
%--------------------Finding vertical lines
line_V = [-1 2 -1;
          -1 2 -1;
          -1 2 -1];
 
V_Page = conv2(Page,line_V);
[r,c] = size(V_Page);
C = floor(c/2);
V_max = max(max(V_Page(:,1:C)));   
V_col_1 =find(max(V_Page)==V_max);
V_max = max(max(V_Page(:,C+1:end)));   
V_col_2 =find(max(V_Page)==V_max);
%--------------------drawing the rectangle on the page
imshow(RealPage)
rectangle('Position',[V_col_1(1) H_row_1(1) V_col_2(1)-V_col_1(1) (H_row_2(1)-H_row_1(1))],'EdgeColor','r','LineWidth',3)
end