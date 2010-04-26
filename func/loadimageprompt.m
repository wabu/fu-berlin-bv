function matrix = loadimageprompt()    
    defaultfn = 'samples/lenna512.bmp';
    # is there an sprintf like funtion to create prompt?
    prompt = sprintf('please give an input file[%s]:', defaultfn);
    filename = input(prompt, 's');
    
    if strcmp(filename, '')
        filename = defaultfn;
    end
    
    # load image into matrix
    matrix = imread(filename);
end
