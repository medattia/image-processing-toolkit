%Fonction pour stockée toutes les images dans une variable matlab
function images=stockage()

chemin = uigetdir('Dossier :');
Files=dir([chemin '\*.jpg'])
n=size(Files,1);
images=zeros(200,200,3,50);
for i=1:n
    FileNames=Files(i).name;
    a=imread(strcat(chemin,'\',FileNames));
    b = imresize(a,[200 200]);
    for j=1:200
        for k=1:200
            images(j,k,:,i)=b(j,k,:);
        end
    end

end
end

