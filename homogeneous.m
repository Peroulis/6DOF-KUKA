function H = homogeneous(in)

rotZ = [cos(in(1))  -sin(in(1))          0        0     ;
       sin(in(1))   cos(in(1))          0        0     ;
       0                0               1        in(2) ;
       0                0               0        1      ];
 
rotX = [1                0               0        in(4) ;
       0              cos(in(3))   -sin(in(3))   0     ;
       0              sin(in(3))   cos(in(3))    0     ;
       0                0               0        1     ];
   
H = rotZ*rotX;

