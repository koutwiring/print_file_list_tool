#!/usr/bin/ruby

#get html file list as Hash
def get_file_hash(dir_path)
  if dir_path =~ /\/\Z/
    file_filter = sprintf("%s*.html", dir_path)
  else
    file_filter = sprintf("%s/*.html", dir_path)
  end
  
  file_list = Hash.new { |hash, key| hash[key] = Array.new() }
  Dir.glob(file_filter) {|file_name| #get each file name
    file_list[file_name][0]="none"
  }
  return file_list
end

#get string from <tag> to </tag> in each html file
def get_file_detail(file_list, tag)
  file_list.keys.each{|file_name|
    string_count = 0
    contents = File.read(file_name)#read file
    
    contents.gsub(/[\t\r\n]/,"").scan(/<#{tag}>([^<#{tag}>]*)<\/#{tag}>/){|match_strings| #get "<tag> string </tag>"
      file_list[file_name][string_count] = match_strings[0].gsub(/<(".*?"|'.*?'|[^'"])*?>/, "") #remove tag and insert hash
      string_count+=1
    }
  }
  return file_list
end

#print file info as html's <li>
def print_html_li(file_list)
  print "<ul>\n"

  file_list.keys.each{|file_name|
    print "\t<li>",file_name,"</li>\n"
    print "\t<ul>\n"
    file_list[file_name].each{|value|
      print "\t\t<li>",value,"</li>\n"
    }
    print "\t</ul>\n"
  }
  
  print "</ul>\n"
end
