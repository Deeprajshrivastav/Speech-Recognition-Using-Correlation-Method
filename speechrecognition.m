%Speech Recognition Using Correlation Method

%% Group Member:
% Name: Shivya shrivastava(TETA17)
% Seat no: T217117

% Speech Recognition Function
function speechrecognition(filename)

clc;

close all;
voice=audioread(filename);               % Reading input audio file
x = voice;                               
x = x';                                  % transpose of input audiofile
x = x(1,:);
x = x';

% List of all of audio file
audiofile = strsplit('one.wav two.wav three.wav four.wav five.wav');
a = [];
for i=1:length(audiofile)
    audio = [audiofile{i}];         % store audio file name
    y1 = audioread(audio);          % read audio file 
    y1 = y1';                       % transepose of audiofile
    y1 = y1(1,:);
    y1 = y1';
    z1 = xcorr(x,y1);          % Calculating Corelation
    m1 = max(z1);
    a = [a, m1];
    l1 = length(z1);          % Calculate length 
    t1 =-((l1-1)/2):1:((l1-1)/2);
    t1 = t1';                       
    figure
    plot(t1, z1);              % ploting audio
end

m1 = a(1);
m2 = a(2);
m3 = a(3);
m4 = a(4);
m5 = a(5);

m6 = 300;
a = [a, m6];
m=max(a);                       
h=audioread('allow.wav');                       % reading allow audio file

if m <= m1
    soundsc(audioread('one.wav'), 50000)
        soundsc(h, 50000)
        disp("System unlocked");                % Display Account unlocked
elseif m<=m2
    soundsc(audioread('two.wav'), 50000)
        soundsc(h, 50000)
        disp("System unlocked");                % Display Account unlocked
elseif m<=m3
    soundsc(audioread('three.wav'), 50000)
        soundsc(h, 50000)
        disp("System unlocked");               % Display Account unlocked
elseif m<=m4
    soundsc(audioread('four.wav'), 50000)
        soundsc(h, 50000)
        disp("System unlocked");               % Display Account unlocked
elseif m<m5
    soundsc(audioread('five.wav'), 50000)
        soundsc(h, 50000)
        disp("System unlocked");              % Display Account unlocked
else
   soundsc(audioread('denied.wav'), 50000)
   disp('Incorrect password');
end
