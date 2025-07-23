# Caminho para o compilador g++
$compiler = "g++"

# Flags de compilação
$flags = "-O2 -Wall -Wextra -Wno-sign-conversion -Wno-unused-parameter -Wno-unused-function -Wconversion -Wdouble-promotion -std=c++20 -fsanitize=undefined -fsanitize=address"

# Nome do binário de saída
$output = "main.exe"

# Diretórios onde procurar arquivos .cpp
$directories = @("src", "engine")

# Caminho do diretório raiz do projeto (onde o script está localizado)
$projectRoot = Get-Location

# Coleta recursiva de todos os arquivos .cpp nas pastas especificadas
$sourceFiles = foreach ($dir in $directories) {
    if (Test-Path $dir) {
        Get-ChildItem -Path $dir -Recurse -Filter *.cpp | ForEach-Object {
            # Gera caminho relativo ao diretório do projeto
            Resolve-Path $_.FullName | ForEach-Object {
                $relativePath = $_.Path.Replace($projectRoot.Path + "\", "")
                $relativePath
            }
        }
    }
    else {
        Write-Warning "Diretório '$dir' não encontrado."
    }
}

if ($sourceFiles.Count -eq 0) {
    Write-Error "Nenhum arquivo .cpp encontrado nas pastas especificadas."
    exit 1
}

# Monta a linha de compilação
$command = "$compiler $flags -o $output $($sourceFiles -join ' ')"

Write-Host "Compilando com o seguinte comando:"
Write-Host $command -ForegroundColor Cyan

# Executa a compilação
Invoke-Expression $command
