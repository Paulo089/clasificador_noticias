function predecir(url)
% Se cargan las variables necesarias para hacer predicciones
load trainedClassifier_tipo.mat 
load trainedClassifier_lugar.mat
load H2.mat
load H3.mat
load palabras_lugar_final.mat
load palabras_tipo_final.mat

txt = extraer_texto(url);

% Clasificacion segun tipo de noticia
palabras_encontradas = {};
for i = 1:length(palabras_tipo_final)
    palabras_encontradas{i} = length(strfind(txt, palabras_tipo_final{i}));
end
mat_palabras = cell2mat(palabras_encontradas);
Var = max(mat_palabras/H2,0);
W2_table = array2table(Var);

tipo = trainedClassifier_tipo.predictFcn(W2_table)

% Clasificacion segun origen de la noticia
palabras_encontradas2 = {};
for i = 1:length(palabras_lugar_final)
    palabras_encontradas2{i} = length(strfind(txt, palabras_lugar_final{i}));
end
mat_palabras2 = cell2mat(palabras_encontradas2);
Var = max(mat_palabras2/H3,0);
W3_table = array2table(Var);

lugar = trainedClassifier_lugar.predictFcn(W3_table)

fprintf('Categoria de la noticia: %s \nOrigen: %s\n', tipo{1}, lugar{1})