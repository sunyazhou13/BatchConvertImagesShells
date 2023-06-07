#!/bin/bash

# 定义Downloads目录路径
downloads_dir="$HOME/Downloads"

# 转换HEIC文件为WebP格式
convert_heic_to_webp() {
  local file_path="$1"
  local file_name="$(basename "$file_path")"
  local file_extension="${file_name##*.}"
  local file_name_no_extension="${file_name%.*}"
  
  if [[ "$file_extension" == "HEIC" || "$file_extension" == "heic" ]]; then
    webp_file_path="$downloads_dir/$file_name_no_extension.webp"
    cwebp -q 80 "$file_path" -o "$webp_file_path"
    echo "转换完成: $webp_file_path"
  fi
}

# 遍历Downloads目录下的文件
find "$downloads_dir" -type f | while read -r file; do
  convert_heic_to_webp "$file"
done

