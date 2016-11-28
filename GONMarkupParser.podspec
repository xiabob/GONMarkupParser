Pod::Spec.new do |s|
  s.name         = "GONMarkupParser"
  s.version      = "0.7.2"
  s.summary      = "NSAttributedString generation from NSString using XML, that can be easily extended. Just edit for my app, this a fork from https://github.com/nicolasgoutaland/GONMarkupParser. You should use nicolasgoutaland/GONMarkupParser!!!"
  s.platform     = :ios, "7.0"
  s.description  = <<-DESC
						Creating rich text under iOS can be cumbersome, needing a lot of code.
						The main goal of GONMarkupParser is to provide an easy to use syntax, near XML/HTML, but more flexible.
						Some others projects exists, allowing you to build NSAttributedString from HTML, but my main goal here was to focus on text semantic. In fact, the parser will detect registered markup and apply style on text.
						The purpose of this was to be able to generate different outputs from the same input string, without editing its content, but editing the markups style.

						GONMarkupParser is not an out of the box solution to parse HTML files.
						ARC only
					DESC

  s.homepage     = "https://github.com/xiabob/GONMarkupParser"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "xiabob" => "xiabob@yeah.net" }
  s.source       = { :git => "https://github.com/xiabob/GONMarkupParser.git", :tag => "#{s.version}" }
  s.source_files  = 'Classes', 'Classes/**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
  s.requires_arc = true
  s.framework    = 'CoreText'
end
