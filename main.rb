#!/usr/bin/ruby

require "./get_filelist"

begin
  file_list = get_file_hash(".")
  file_list = get_file_detail(file_list, "h1")
  print_html_li(file_list)
end
