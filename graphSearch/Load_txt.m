function [data, n] = Load_txt(filename)
    fileID = fopen(filename, 'r');
    n = fscanf(fileID, '%f', 1);
    data = fscanf(fileID, '%f %f', [2 inf]);
    fclose(fileID);
end
