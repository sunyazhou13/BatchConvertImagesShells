#!/bin/bash

# 定义Download目录路径
download_dir="$HOME/Downloads"

# 转换HEIC文件为PNG格式
convert_heic_to_png() {
  local file_path="$1"
  local file_name="$(basename "$file_path")"
  local file_extension="${file_name##*.}"
  local file_name_no_extension="${file_name%.*}"
  
  if [[ "$file_extension" == "HEIC" || "$file_extension" == "heic" ]]; then
    png_file_path="$download_dir/$file_name_no_extension.png"
    sips -s format png "$file_path" --out "$png_file_path"
    echo "转换完成: $png_file_path"
  fi
}

# 遍历Download目录下的文件
find "$download_dir" -type f | while read -r file; do
  convert_heic_to_png "$file"
done

