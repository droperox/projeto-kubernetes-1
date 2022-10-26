echo "Criando as imagens.................."

docker build -t droperox/projeto-backend:1.0 backend/.
docker build -t droperox/projeto-database:1.0 database/.

echo "Realizando o push das imagens.................."

docker push droperox/projeto-backend:1.0
docker push droperox/projeto-database:1.0

echo "Criando serviços no cluster kubernetes.................."

kubectl apply -f ./services.yml

echo "Realizando os deployments.................."

kubectl apply -f ./deployment.yml