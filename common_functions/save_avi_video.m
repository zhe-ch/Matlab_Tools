%================================================
% FileName: save_avi_video.m
% Designby: Zhe
% Modified: 08/06/2021
% Describe: Save a loop of plots into a video in AVI format.
%           Framerate of the video can be defined by user:
%           E.g. writerObj.FrameRate = 1; (1 fps)
%================================================================

figure;
for c = 1:256
    subplot(3,1,1);
    plot(norm_traces(c,:));
    subplot(3,1,2);
    plot(liaf_traces(c,:));
    subplot(3,1,3);
    stem(spike_traces(c,:));
    F(c) = getframe(gcf);
    drawnow
end

% create the video writer with 1 fps
writerObj = VideoWriter('SpikeDetect.avi');
writerObj.FrameRate = 1;

% open the video writer
open(writerObj);
% write the frames to the video
for c = 1:length(F)
    % convert the image to a frame
    frame = F(c);
    writeVideo(writerObj, frame);
end

% close the writer object
close(writerObj);