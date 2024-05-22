clear all; close all; clc
thisdir = pwd;
artdir = './questions';
cd(artdir)
subdirs = dir('q_*.txt');
cd(thisdir)

fid = fopen('questionList.txt','w');

s = 'var qlist = [';
fprintf(fid,'%s\n',s);

cd(artdir)

n = 1;
for i=1:length(subdirs)
    
    str = fileread([subdirs(i).name(3:end-4) '_s.txt']);
    src_info = regexp(str, '\r\n|\r|\n', 'split');
    src_s = src_info{1};
    srclink_s = src_info{2};
    
    str = fileread(subdirs(i).name);
    images = regexp(str, '\r\n|\r|\n', 'split');
    
    for j=1:length(images)
        
        s = '{';
        fprintf(fid,'%s\n',s);
        
        s = ['"q": "' images{j} '",'];
        fprintf(fid,'%s\n',s);
        
        s = ['"src": " ' src_s '",'];
        fprintf(fid,'\t%s\n',s);
        
        s = ['"srclnk": "' srclink_s '",'];
        fprintf(fid,'\t%s\n',s);
        
        s = ['"qid":' num2str(n-1) ','];
        fprintf(fid,'\t%s\n',s);
        
        
        if ((i==length(subdirs))&(j==length(images)))
            s = '}';
        else
            s = '},';
        end
        fprintf(fid,'%s\n',s);
        
        n = n+1;
    end
    
end

s = '];';
fprintf(fid,'%s\n',s);

cd(thisdir)

fclose(fid)