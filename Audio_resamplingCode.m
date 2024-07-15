% Directory containing the original .wav files
input_dir = 'C:\Users\JAHANGIR\Downloads\Noisy_Recordings';

% Directory to save the converted .wav files
output_dir = 'C:\Users\JAHANGIR\Downloads\44100 data';

% Create the output directory if it doesn't exist
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

% List all .wav files in the input directory
file_list = dir(fullfile(input_dir, '*.wav'));

% Loop through each file
for i = 1:length(file_list)
    filename = file_list(i).name;
    disp(['Converting file: ' filename]);
    
    % Read the original audio file
    [audio, fs] = audioread(fullfile(input_dir, filename));
    
    % Resample the audio to 44100 Hz
    audio_resampled = resample(audio, 44100, fs);
    
    % Write the resampled audio to the output directory
    output_filename = fullfile(output_dir, filename);
    audiowrite(output_filename, audio_resampled, 44100);
    
    disp(['File converted and saved as: ' output_filename]);
end

disp('All files converted successfully.');
