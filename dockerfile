FROM nginx:latest


# Copia arquivos estáticos para o local padrão do Nginx
COPY index.html /usr/share/nginx/html/index.html



EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]