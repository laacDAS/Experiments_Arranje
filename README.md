# 🌾💻 Análise de Experimentos Agrícolas com Shiny

Esta é uma aplicação web interativa desenvolvida com o framework [Shiny](https://shiny.posit.co/) em R, destinada à análise estatística de experimentos agrícolas. A aplicação utiliza o pacote `AgroR` para realizar os cálculos e análises.

## 🌐 Visão Geral

O objetivo deste projeto é fornecer uma interface gráfica amigável para que pesquisadores e estudantes da área de ciências agrárias possam analisar seus dados experimentais de forma rápida e intuitiva, sem a necessidade de escrever código R complexo.

## ▶️ Como Executar o Projeto

Para executar esta aplicação em sua máquina local, siga os passos abaixo.

### 📦 Pré-requisitos

* 📌 R instalado
* 💻 RStudio Desktop (recomendado) instalado

### 🔧 Instalação

1. 📥 Clone ou faça o download deste repositório para o seu computador
2. 📂 Abra o projeto no RStudio
3. 📦 Instale as dependências necessárias com:

   ```r
   install.packages(c("shiny", "AgroR"))
   ```

### 🚀 Executando a Aplicação

Com o projeto aberto no RStudio, você pode iniciar a aplicação de duas maneiras:

1. ▶️ Abra o arquivo `app.R` e clique no botão **Run App** no canto superior do editor
2. Ou execute o comando abaixo no console do R:

   ```r
   shiny::runApp()
   ```

## 🗂️ Estrutura do Projeto

O código é organizado da seguinte forma, seguindo boas práticas para aplicações Shiny:

* **`app.R`**: Script principal que carrega as bibliotecas e inicia a aplicação Shiny, conectando a UI e o servidor.
* **`ui.R`**: Define a interface do usuário (*frontend*) da aplicação — onde são criados os painéis, abas, inputs e outputs.
* **`server.R`**: Contém a lógica do servidor (*backend*) — processa as entradas, executa análises com o `AgroR` e gera os resultados como tabelas e gráficos.
