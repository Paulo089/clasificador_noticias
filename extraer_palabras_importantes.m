function palabras = extraer_palabras_importantes(noticias)
words = string();
for i = 1:length(noticias)
    url = noticias{i};
    txt = extraer_texto(url);
    
    words = cat(1,words, split(txt));
end
% Se ordenan las palabras
table = tabulate(words);

% Se obtiene la frecuencia de cada palabra, de menor a mayor
table_ordenada = sortrows(table,2);

% Se retornan las 50 palabras con mayor frecuencia
palabras = table_ordenada(length(table_ordenada)-50:length(table_ordenada))

