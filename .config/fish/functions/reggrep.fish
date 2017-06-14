function reggrep
    for jar in *.jar 
        for file in (jar -tf $jar) 
            unzip -p $jar $file | grep -qi "$argv"; and echo "$jar: $file"
        end
    end | sort -u
end
