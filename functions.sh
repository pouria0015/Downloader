#!/usr/bin/env bash

menu (){



  echo -e "╭━━━╮╱╱╱╱╱╱╱╱╱╱╭╮╱╱╱╱╱╱╱╱╭╮╱╱╱╱╱╱╱╱╱╱╱╱╭╮ "
  echo -e "╰╮╭╮┃╱╱╱╱╱╱╱╱╱╱┃┃╱╱╱╱╱╱╱╱┃┃╱╱╱╱╱╱╱╱╱╱╱╭╯╰╮ "
  echo -e "╱┃┃┃┣━━┳╮╭╮╭┳━╮┃┃╭━━┳━━┳━╯┃╭╮╭┳━━┳━╮╭━┻╮╭╋━━┳━╮ "
  echo -e "╱┃┃┃┃╭╮┃╰╯╰╯┃╭╮┫┃┃╭╮┃╭╮┃╭╮┃┃╰╯┃╭╮┃╭╮┫━━┫┃┃┃━┫╭╯ "
  echo -e "╭╯╰╯┃╰╯┣╮╭╮╭┫┃┃┃╰┫╰╯┃╭╮┃╰╯┃┃┃┃┃╰╯┃┃┃┣━━┃╰┫┃━┫┃ "
  echo -e "╰━━━┻━━╯╰╯╰╯╰╯╰┻━┻━━┻╯╰┻━━╯╰┻┻┻━━┻╯╰┻━━┻━┻━━┻╯ \n"

}

downloadList() {

  fileListPath="list.txt"
  counter=1

  read -p "Do you want the counter to be added to the end of the file name?(y/n)" question
  if [[ "$question" != "y" && "$question" != "n" ]]; then
    echo -e "\n --- Enter the inputs correctly! --- \n"
    return 1
  fi

  while IFS= read -r link || [[ -n "$link" ]]; do
    link=$(echo "$link" | xargs)
    fileName=$(basename "$link")

    if [[ "$question" == "y" ]]; then
      baseName="${fileName%.*}"
      extension="${fileName##*.}"
      newFileName="${baseName}_${counter}.${extension}"
      wget "$link" -O "Downloads/$newFileName"
      counter=$((counter + 1))
    elif [[ "$question" == "n" ]]; then
      wget "$link" -O "Downloads/$fileName"
    fi

  done < "$fileListPath"

}

downloadSingle() {
  read -p "Enter the file URL to download: " singleFileUrl

  fileName=$(basename "$singleFileUrl" | cut -d'?' -f1)

  if [[ "$fileName" != *.* ]]; then
    fileName="${fileName}.dat"
  fi
  
  wget "$singleFileUrl" -O "Downloads/$fileName"
}
