# doom-clone-poo

## Instruções para compilar:

No terminal linux (ou pelo WSL, caso esteja no Windows) instale as seguintes dependências:
```
sudo apt install build-essential cmake
```

Por fim, execute os seguintes comandos para compilar o projeto.
```
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build .
```