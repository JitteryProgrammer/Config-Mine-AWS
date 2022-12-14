#!/bin/bash



# Variáveis
opcao=0

# Loop do Menu
while [ $opcao -ne 5 ]; do

  # Mostrar opções
  echo "######################################"
  echo "  Configuração do Servidor para Minecraft"
  echo "######################################"
  echo "  1 - Configurar região do servidor"
  echo "  2 - Configurar tipo de instância"
  echo "  3 - Configurar quantidade de memória"
  echo "  4 - Configurar grupo de segurança"
  echo "  5 - Sair do menu"
  echo "######################################"
  echo
  echo -n "Digite a opção desejada: "
  read opcao

  # Executar tarefa
  case $opcao in
    1)
      # Configuração da região do servidor
      echo "Selecione a região para o seu servidor:"
      echo "1 - EUA Oeste (Oregon)"
      echo "2 - EUA Leste (Virginia)"
      echo "3 - EUA Central (Illinois)"
      echo "4 - Canadá (Central)"
      echo -n "Opção: "
      read regiao
      case $regiao in
        1)
          aws configure set default.region us-west-2
          ;;
        2)
          aws configure set default.region us-east-1
          ;;
        3)
          aws configure set default.region us-central-1
          ;;
        4)
          aws configure set default.region ca-central-1
          ;;
        *)
          echo "Opção inválida."
          ;;
      esac
      echo
      ;;
    2)
      # Configuração do tipo de instância
      echo "Selecione o tipo de instância para o seu servidor:"
      echo "1 - t2.micro"
      echo "2 - t2.small"
      echo "3 - t2.medium"
      echo -n "Opção: "
      read instancia
      case $instancia in
        1)
          aws configure set default.instance_type t2.micro
          ;;
        2)
          aws configure set default.instance_type t2.small
          ;;
        3)
          aws configure set default.instance_type t2.medium
          ;;
        *)
          echo "Opção inválida."
          ;;
      esac
      echo
      ;;
    3)
      # Configuração da quantidade de memória
      echo "Selecione a quantidade de memória para o seu servidor:"
      echo "1 - 2 GB"
      echo "2 - 4 GB"
      echo "3 - 8 GB"
      echo -n "Opção: "
      read memoria
      case $memoria in
        1)
          aws configure set default.memory_size 2GB
          ;;
        2)
          aws configure set default.memory_size 4GB
          ;;
        3)
          aws configure set default.memory_size 8GB
          ;;
        *)
          echo "Opção inválida."
          ;;
      esac
      echo
      ;;
    4)
      # Configuração do grupo de segurança
      echo "Selecione o grupo de segurança para o seu servidor:"
      echo "1 - Grupo de Segurança Padrão"
      echo "2 - Grupo de Segurança Aberta"
      echo -n "Opção: "
      read grupo
      case $grupo in
        1)
          aws configure set default.security_group_id sg-default
          ;;
        2)
          aws configure set default.security_group_id sg-open
          ;;
        *)
          echo "Opção inválida."
          ;;
      esac
      echo
      ;;
    5)
      # Sair do menu
      echo "Saindo do menu de configuração."
      ;;
    *)
      # Opção inválida
      echo "Opção inválida."
      ;;
  esac
done
