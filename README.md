# Lorenz-3D-Music-Visualizer
A 3D music visualizer that reacts to music and live audio

*Import Peasy Cam in Processing for 3D view*

*Also import Minim and Minim analysis*

I have created a 3D music visualizer using Lorenz and Rössler attractors, using differential equations that define each respective system. The two attractors are drawn continuously, and they react to the music being played by changing their color based on the amplitudes of different frequency bands in the audio, thereby creating stunning visual patterns. Since the sketch is in 3D, I also made a network of jittering, twinkling stars that are suspended in space around the attractors. The ‘twinkling’ of the stars is controlled by greyscale color that is also controlled by the audio much in the same away as the attractors.

The project is highly interactive and user input defines much of what is seen. User input can not only define what particular attractor is going to be drawn at a given point, but it will also define what audio input will be used, among other things. The audio options are Money by Pink Floyd and Gravity by John Mayer, both of which can be played and paused at the will at the user. There’s a third option of using the microphone for any live audio; in this case the attractor and the stars react to the sounds of the environment! Properties like rotation speed can be played around with, and the user has the option to move around the 3D space using mouse clicks and drags.

The list of interactions that a user can do (also included in the code comments) are as follows:

Press 'l' to start creating a Lorenz attractor

Press 'r' to start creating a Rössler attractor
(note: creating a Rössler attractor while a lorenz is already drawing would just switch between attractors, and vice versa)

Click and drag the mouse to move the camera around

Scroll up and down to zoom in and out

Press 'm' to start playing Money by Pink Floyd
  
Press 'g' to start playing Gravity by John Mayer

(note: only one song can be played at one time! Playing Gravity while Money is being played will pause Money and start playing Gravity, and vice versa. Pressing 'm' again would simply pause Money)

Press 'i' to turn microphone on (this would turn off music)

Press 's' to toggle the stars on. Pressing 's' again would toggle them off.

Press 'c' to make a continuous attractor

Press 'p' to make it in point form again (the sketch always starts in point form)

Press 'f' for the camera rotation to go faster (making good visuals) and press 'F' to make it go
even faster. Pressing 'n' would make it come back to normal speed

Double click anywhere on the sketch for the attractor to go to the original orientation with which
it started

Cmd + click and drag to move the attractor around.

*(Note: The differential equations used for the Lorenz system as well as the Rössler system are taken from Wikipedia. The code to draw the attractors is inspired from Dan Shiffman’s YouTube tutorials on The Coding Train).*

Watch the program in action: https://www.youtube.com/watch?v=K75450eiYZY&t=24s
