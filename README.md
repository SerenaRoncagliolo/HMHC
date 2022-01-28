# Obstacle detection and tracking in maritime environments

*For further information about the project read the "HMCH_report.pdf" document.*

**Motivations and general objectives**

The main objective of this laboratory is to collect and analyse body measurements data taken
from a subject in order to simulate motion on a simulated humanoid subject.
Due to the present health crisis, the measurements of the body segments were not performed,
but were provided with the subject. By using given data of the 41 body segments parameters
(BSP) we managed to build the modified Hanavan Model, the geometric human body model
designed by Hanavan (1964).
We were given the measurements of 5 different groups, with the result of the mean value and
the standard deviation of collected data.
We were then given a set of files containing data collected while the subject performed different
movements such as waving one hand. Those files contained the position and angle of each body
segment and could thus be used to simulate the mannequin displacement. Moreover another set
of files contained the measured ground reaction forces and moments in the performing of each
of those same movements. We computed the theoretical ground reaction forces and moments
and compared them to the ones obtained by measurement

**Repository**

The code repository is organised as follows:
- ForceData → it contains all the data files provided with the subject
- Hanavan model → it contains the scripts for the construction of the model from the Hanavan parameter
- NE → it contains scripts which apply the Newton-Euler algorithm to compute the ground reaction forces and bodies moments
- animation → it contains the script permitting to have a visualisation of the motions
- motion data → .drf data motions files
- motions → data motions files converted in .mat

**How to run the code**
In order to run the code one need first to select the name of the motion they want to execute in the Matlab file *run.m*
The correct names of the motion to insert are listed in the comments of the file *run.m*

We are then required to set the correct offset value in the file *plot_ground_reaction.m* in order
to visualise the computed and measured graphs correctly.
We set offset values on Line 22. We may use the following offset values:
- 2 for fastArm
- 2 for slowArm
- 2 for fastArm
- 1.8 for fastKick
- 2.1 for fastKickArm
- 1.4 for mediumKick
- 1.5 for mediumKickArm
- 1.5 for slowKick
- 1.8 for fastKick
- 1 for JumpFeetUp


**Authors**

Serena Roncagliolo: *serena.roncagliolo@gmail.com*

Camille Vindolet: *c.vindolet@gmail.com*

Aarsh Thakker 


