%% Ulloa, Andres    Image Processing Interview Example    11/23/15

% The purpose of this script is to take eye traking data from multiple
% participants looking at a single image, smooth it using kernel density 
% estimation assuming a normal distribution, and overlay it on the image

% Image and eye tracking data source 
% [http://www.csc.kth.se/~kootstra/index.php?item=215&menu=200]

% clear all
close all

%% Image and Eye Tracking Data Import 
h1           = importdata('animals_01.png');
% eyeTrackData = importdata('eyeTrackData.mat');

%% Define as X and Y tracking coordinates
d   = [eyeTrackData.animals.animals_01.subject_01.fixX;eyeTrackData.animals.animals_01.subject_01.fixY];
p   = gkde2(d);


Alphadata = p.pdf*1000000 > 1;
B = double(Alphadata)
B(B==0) = .1
surf(p.x,p.y,p.pdf*1000000,'FaceAlpha','flat',...
    'AlphaDataMapping','scaled',...
    'AlphaData',p.pdf*1000000,...
    'FaceColor','interp','EdgeAlpha',0);
colormap(jet)
hold on

img    = imread('animals_01.png');     %# Load a sample image
x      = size(p.x)
y      = size(p.y)
xImage = [p.x(1,1)+125 p.x(1,x(1))+125; p.x(x(1),1)+125 p.x(x(1),x(1))+125];   %# The x data for the image corners
yImage = [p.y(1,y(1))-10 p.y(1,1)-10; p.y(y(1),y(1))-10 p.y(y(1),1)-10];             %# The y data for the image corners
zImage = [0 0; 0 0];   %# The z data for the image corners
surf(xImage,yImage,zImage,...    %# Plot the surface
     'CData',img,...
     'FaceColor','texturemap');
set(gca,'Ydir','reverse')
view(2)
axis([p.x(1,1)+125 p.x(1,x(1))+125 p.y(1,y(1))-10 p.y(y(1),y(1))-10])

 
figure(2)
image(h1)
hold on
scatter(eyeTrackData.animals.animals_01.subject_01.fixX,eyeTrackData.animals.animals_01.subject_01.fixY);
