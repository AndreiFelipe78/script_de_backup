#!/usr/bin/env bash

# backup-script.sh - script para backup de arquivos em formato zip 
# Autor: Andrei
# Manutenção: Andrei

#  ---------------------------------------------------------------------------#
# historico:

#   v1.0 16/08/2022, Autor da mundança: Andrei
#        - criado o script
#----------------------------------------------------------------------------#
#Testado em:
#   bash 5.1.16(1)
# ---------------------------------------------------------------------------#


# ---------------------------------VARIÁVEIS---------------------------------#

ARQUIVO_PARA_ZIP="/var/www/html/media"
ARQUIVO_ZIPADO="/backup/media.zip"
DESTINATION="root@192.168.0.1"

#-------------------------------- TESTES -----------------------------------------#
[ ! -x "$(which rsync)" ] && {
    echo "É necessário instalar o rsync primeiro"
    exit 1
}
#------------------------------ EXECUÇÃO -----------------------------------------#

zip "$ARQUIVO_ZIPADO" "$ARQUIVO_PARA_ZIP"
rsync -avz "$ARQUIVO_ZIPADO"  "$DESTINATION"
