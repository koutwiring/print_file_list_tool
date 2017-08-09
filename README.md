# print_file_list_tool
* Waht is  
This tool is for Ruby on Rails.  
This can get html file list and find string from ＜tag＞ to ＜/tag＞.  
(You can choose tag you want, for example title and h1)  
And print filename and string between tag as html list.  

* Usage:  
You give directory path and tag.  
```
require "./get_filelist"
begin
	file_list = get_file_hash(".")
  file_list = get_file_detail(file_list, "title")
  print_html_li(file_list)
end
```
