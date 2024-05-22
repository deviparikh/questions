clear all; close all; clc
thisdir = pwd;
artdir = '../img/art/';

fid = fopen('artList.txt','w');

s = 'var alist = [';
fprintf(fid,'%s\n',s);

cd(artdir)

images = [dir('*.png')];

for j=1:length(images)

    s = '{';
    fprintf(fid,'%s\n',s);

    name = images(j).name;

    s = ['"art": "../static/img/art/' name '",'];
    fprintf(fid,'%s\n',s);

    s = ['"apid":' num2str(j-1) ','];
    fprintf(fid,'\t%s\n',s);

    if ((j==length(images)))
        s = '}';
    else
        s = '},';
    end
    fprintf(fid,'%s\n',s);
end

s = '];';
fprintf(fid,'%s\n',s);

cd(thisdir)

fclose(fid)