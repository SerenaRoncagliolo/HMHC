%Made by Nicolas Testard if there is any question --hello
%Modified by Aarsh 
% will take input from Run.m for Motion variable
% Save Motion+"_q.mat" file in motions folder as motion struct
%
% 
addpath('motion_data')
global Motion;

fclose("all");
file=fopen(Motion+".drf");
ind_time=1;
char='azerty';
while ~isempty(char)
    char=fread(file,1, 'uint8=>char');
    if char=='t'
        char=fread(file,1, 'uint8=>char');
        if char=='s'
            %% Time
            char=fread(file,1, 'uint8=>char');
            t='';
            while (char ~='d')
                t=strcat(t,char);
                char=fread(file,1, 'uint8=>char');
            end
            t=t(1:end-1);
            Time(ind_time)=str2double(t);

            
            %% First and second segment vectors
            ind_segment=1;
            pos1=zeros(17,6);
            pos2=zeros(17,9);
            while ind_segment<=17
                ind=0;
                while ind<2
                    char=fread(file,1, 'uint8=>char');
                    if char=='['
                        ind=ind+1;
                    end
                end
                
                %first
                vec=zeros(1,6);
                for ind_vec=1:6
                    char=fread(file,1, 'uint8=>char');
                    val='';
                    while (char~=' ')&&(char~=']')
                        val=strcat(val,char);
                        char=fread(file,1, 'uint8=>char');
                    end
                    vec(ind_vec)=str2double(val);
                end
                pos1(ind_segment,:)=vec;
                
                fread(file,1, 'uint8=>char');%skip '['
                
                %second
                vec=zeros(1,9);
                for ind_vec=1:9
                    char=fread(file,1, 'uint8=>char');
                    val='';
                    while (char~=' ')&&(char~=']')
                        val=strcat(val,char);
                        char=fread(file,1, 'uint8=>char');
                    end
                    vec(ind_vec)=str2double(val);
                end
                pos2(ind_segment,:)=vec;
                ind_segment=ind_segment+1;
                
            end
            first{ind_time}=pos1;
            second{ind_time}=pos2;
            
            %% Third and fourt vectors
            ind_joint=1;
            while ind_joint<=20
                ind=0;
                if ind_joint==1
                    ind=-1;
                end
                while ind<2
                    char=fread(file,1, 'uint8=>char');
                    if char=='['
                        ind=ind+1;
                    end
                end
                
                %third
                vec=zeros(1,6);
                for ind_vec=1:6
                    char=fread(file,1, 'uint8=>char');
                    val='';
                    while (char~=' ')&&(char~=']')
                        val=strcat(val,char);
                        char=fread(file,1, 'uint8=>char');
                    end
                    vec(ind_vec)=str2double(val);
                end
                pos1(ind_joint,:)=vec;
                
                fread(file,1, 'uint8=>char');%skip '['
                
                %fourth
                vec=zeros(1,9);
                for ind_vec=1:9
                    char=fread(file,1, 'uint8=>char');
                    val='';
                    while (char~=' ')&&(char~=']')
                        val=strcat(val,char);
                        char=fread(file,1, 'uint8=>char');
                    end
                    vec(ind_vec)=str2double(val);
                end
                pos2(ind_joint,:)=vec;
                ind_joint=ind_joint+1;
            end
            third{ind_time}=pos1;
            fourth{ind_time}=pos2;
                
            ind_time=ind_time+1;
        end               
    end
end

fclose("all");
% motion.name=Motion;
 motion.time=Time;
for k=1:length(Time)
    values=first{k};
    motion(1).q(:,k)=transpose(values(1,:));
    motion(2).q(:,k)=transpose(values(2,:));
    motion(3).q(:,k)=transpose(values(3,:));
    motion(4).q(:,k)=transpose(values(4,:));
    motion(5).q(:,k)=transpose(values(5,:));
    motion(6).q(:,k)=transpose(values(6,:));
    motion(7).q(:,k)=transpose(values(7,:));
    motion(8).q(:,k)=transpose(values(8,:));
    motion(9).q(:,k)=transpose(values(9,:));
    motion(10).q(:,k)=transpose(values(10,:));
    motion(11).q(:,k)=transpose(values(11,:));
    motion(12).q(:,k)=transpose(values(12,:));
    motion(13).q(:,k)=transpose(values(13,:));
    motion(14).q(:,k)=transpose(values(14,:));
    motion(15).q(:,k)=transpose(values(15,:));
    motion(16).q(:,k)=transpose(values(16,:));
    motion(17).q(:,k)=transpose(values(17,:));
end

for k=1:length(Time)
    values=third{k};
    motion(1).J(:,k)=transpose(values(1,:));
    motion(2).J(:,k)=transpose(values(2,:));
    motion(3).J(:,k)=transpose(values(3,:));
    motion(4).J(:,k)=transpose(values(4,:));
    motion(5).J(:,k)=transpose(values(5,:));
    motion(6).J(:,k)=transpose(values(6,:));
    motion(7).J(:,k)=transpose(values(7,:));
    motion(8).J(:,k)=transpose(values(8,:));
    motion(9).J(:,k)=transpose(values(9,:));
    motion(10).J(:,k)=transpose(values(10,:));
    motion(11).J(:,k)=transpose(values(11,:));
    motion(12).J(:,k)=transpose(values(12,:));
    motion(13).J(:,k)=transpose(values(13,:));
    motion(14).J(:,k)=transpose(values(14,:));
    motion(15).J(:,k)=transpose(values(15,:));
    motion(16).J(:,k)=transpose(values(16,:));
    motion(17).J(:,k)=transpose(values(17,:));
    motion(18).J(:,k)=transpose(values(18,:));
    motion(19).J(:,k)=transpose(values(19,:));
    motion(20).J(:,k)=transpose(values(20,:));
end

save("motions\"+Motion+"_q",'motion');

clear char ind ind_segment ind_time pos1 pos2 time val vec file ind_vec Time k Motion values first second third fourth ind_joint 
