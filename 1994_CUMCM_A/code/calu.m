x = [0 400 800 1200 1600 2000 2400 2800 3200 3600 4000 4400 4800 5200 5600];
y = [4800 4400 4000 3600 3200 2800 2400 2000 1600 1200 800 400 0];
z = [1350 1370 1390	1400 1410 960 940 880 800 690 570 430 290 210 150;
     1370 1390b 1410	1430 1440 1140 1110	1050 950 820 690 540 380 300 210;
     1380 1410 1430 1450	1470 1320 1280 1200	1080 940 780 620 460 370 350;
     1420 1430 1450 1480	1500 1550 1510 1430	1300 1200 980 850 750 550 500;
     1430 1450 1460 1500	1550 1600 1550 1600	1600 1600 1550 1500	1500 1550 1550;
     950	1190 1370 1500 1200	1100 1550 1600 1550	1380 1070 900 1050 1150	1200;
     910	1090 1270 1500 1200	1100 1350 1450 1200	1150 1010 880 1000 1050	1100;
     880	1060 1230 1390 1500	1500 1400 900 1100 1060	950	870	900	930	950;
     830	980	1180 1320 1450 1420	1400 1300 700 900 850 840 380 780 750;
     740	880	1080 1130 1250 1280	1230 1040 900 500 700 780 750 650 550;
     650	760	880	970	1020 1050 1020 830	800	700	300	500	550	480	350;
     510	620	730	800	850	870	850	780	720	650	500	200	300	350	320;
     370	470	550	600	670	690	670	620	580	450	400	300	100	150	250];
 
x1= 0:10:5600;
y1= 0:10:4800;
[x2,y2]=meshgrid(x1,y1); 
t11=interp2(x,y,z,x2,y2,'bicubic'); 

k = 68400;
lie = 285;
alpha = 1
dis = zeros(k,k);
for i = 2:284
    for j = 2:239
        for k = 2:284
            for m = 2:239
                dx1 = abs(x1(i) - x1(i-k));
                dy1 = abs(y1(j) - y1(j-m));
                dz1 = abs(t11(j,i) - t11(j-m,i-k));
                alpha1 = dz1/(dx1^2+dy1^2)^0.5;
                if alpha1 <= alpha
                    dis(j*lie+i,(j-m)*lie+i-k) = (dx1^2+dy1^2+dz1^2)^0.5;
                else
                    dis(j*lie+i,(j-m)*lie+i-k) = inf;
                end
                dx1 = abs(x1(i) - x1(i+k));
                dy1 = abs(y1(j) - y1(j+m));
                dz1 = abs(t11(j,i) - t11(j+m,i+k));
                alpha1 = dz1/(dx1^2+dy1^2)^0.5;
                if alpha1 <= alpha
                    dis(j*lie+i,(j+m)*lie+i+k) = (dx1^2+dy1^2+dz1^2)^0.5;
                else
                    dis(j*lie+i,(j+m)*lie+i+k) = inf;
                end
                dx1 = abs(x1(i) - x1(i-k));
                dy1 = abs(y1(j) - y1(j+m));
                dz1 = abs(t11(j,i) - t11(j-m,i+k));
                alpha1 = dz1/(dx1^2+dy1^2)^0.5;
                if alpha1 <= alpha
                    dis(j*lie+i,(j+m)*lie+i-k) = (dx1^2+dy1^2+dz1^2)^0.5;
                else
                    dis(j*lie+i,(j+m)*lie+i-k) = inf;
                end
                dx1 = abs(x1(i) - x1(i+k));
                dy1 = abs(y1(j) - y1(j-m));
                dz1 = abs(t11(j,i) - t11(j+m,i-k));
                alpha1 = dz1/(dx1^2+dy1^2)^0.5;
                if alpha1 <= alpha
                    dis(j*lie+i,(j-m)*lie+i+k) = (dx1^2+dy1^2+dz1^2)^0.5;
                else
                    dis(j*lie+i,(j-m)*lie+i+k) = inf;
                end
                dx1 = abs(x1(i) - x1(i-k));
                dy1 = abs(y1(j) - y1(j));
                dz1 = abs(t11(j,i) - t11(j-m,i));
                alpha1 = dz1/(dx1^2+dy1^2)^0.5;
                if alpha1 <= alpha
                    dis(j*lie+i,(j-m)*lie+i) = (dx1^2+dy1^2+dz1^2)^0.5;
                else
                    dis(j*lie+i,(j-m)*lie+i) = inf;
                end
                dx1 = abs(x1(i) - x1(i+k));
                dy1 = abs(y1(j) - y1(j));
                dz1 = abs(t11(j,i) - t11(j+m,i));
                alpha1 = dz1/(dx1^2+dy1^2)^0.5;
                if alpha1 <= alpha
                    dis(j*lie+i,(j+m)*lie+i) = (dx1^2+dy1^2+dz1^2)^0.5;
                else
                    dis(j*lie+i,(j+m)*lie+i) = inf;
                end
                dx1 = abs(x1(i) - x1(i));
                dy1 = abs(y1(j) - y1(j-m));
                dz1 = abs(t11(j,i) - t11(j,i-k));
                alpha1 = dz1/(dx1^2+dy1^2)^0.5;
                if alpha1 <= alpha
                    dis(j*lie+i,j*lie+i-k) = (dx1^2+dy1^2+dz1^2)^0.5;
                else
                    dis(j*lie+i,j*lie+i-k) = inf;
                end
                dx1 = abs(x1(i) - x1(i));
                dy1 = abs(y1(j) - y1(j+m));
                dz1 = abs(t11(j,i) - t11(j,i+k));
                alpha1 = dz1/(dx1^2+dy1^2)^0.5;
                if alpha1 <= alpha
                    dis(j*lie+i,j*lie+i+k) = (dx1^2+dy1^2+dz1^2)^0.5;
                else
                    dis(j*lie+i,j*lie+i+k) = inf;
                end
            end
        end  
    end
end





