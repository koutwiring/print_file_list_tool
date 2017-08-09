# print_file_list_tool
* Waht is  
This tool is for Ruby on Rails.  
This can get html file list and find string from ＜tag＞ to ＜/tag＞.  
(You can choose tag you want, for example title and h1)  
And print filename and string between tag as html list.  

* Usage:  
You give directory path and tag.  
```main.rb
require "./get_filelist"
begin
  file_list = get_file_hash(".")
  file_list = get_file_detail(file_list, "title")
  print_html_li(file_list)
end
```  
```result  
$ ruby main.rb 
<ul>
	<li>./test.html</li>
	<ul>
		<li>none</li>
	</ul>
	<li>./test2.html</li>
	<ul>
		<li>none</li>
	</ul>
</ul>
```  

* 目的  
Ruby on Rails等で使用する目的で作りました。  
指定したディレクトリのhtmlファイル一覧を取得し、指定したhtmlタグに囲まれた文字を抽出します。  
抽出したあとhtmlのliタグによる箇条書きでの出力が行えます。  

* 使用方法  
ディレクトリのパスとタグを指定して関数に与えるだけです。  
実行例は上記（英語でのUsage）の通りです。  
