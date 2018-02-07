# 6DOF-KUKA
A 6 degree of freedom robotic manipulator (KUKA) follows a trajectory from P1 to P2

Start the program by writing in the command window 

>> kukaStart

Matlab loads the workspace, the trajectory that the end effector follows (calculated with a 5th degree equation) 
and the robotic manipulator in the zero position

Then, the manipulator is places in the first point of the trajectory (q1 = 30 deg)

The forward Kinematics is calculated by Denavit - Hartenberg parameters

The inverse kinematics is calculated for constant q1 = 30 deg, q4 = q6 = 0 deg. Variables are the joint angles 
q2, q3, q5 (3R planar manipulator), the joint velocities and accelerations. 


REMARK: ANIMATION is depicted in figure 1. 
