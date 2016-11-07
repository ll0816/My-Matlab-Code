function n = Size(filename) 
    fileID = fopen(filename, 'r');
    n = fscanf(fileID, '%f', 1);
    fclose(fileID);
end