# Verify the built site without contacting external websites.
require 'cgi'
require 'json'
require 'nokogiri'
require 'pathname'
require 'uri'
require 'yaml'

root = Pathname.new(ARGV.fetch(0, '_site')).expand_path
prefix = ARGV.fetch(1, '').sub(%r{/$}, '')
config = YAML.load_file('_config.yml', aliases: true)
origin = config.fetch('url').sub(%r{/$}, '')
errors = []
documents = {}

Dir.glob('_data/**/*.{yml,yaml,json}').each do |path|
  path.end_with?('.json') ? JSON.parse(File.read(path)) : YAML.load_file(path, aliases: true)
end
YAML.load_file('.github/workflows/deploy.yml', aliases: true)
abort "Missing build directory: #{root}" unless root.directory?

root.glob('**/*.html').each do |path|
  text = path.read
  errors << "#{path.relative_path_from(root)}: unresolved Liquid" if text.match?(/\{%|\{\{/)
  if text.match?(/xiaoxin|xiang zhang|danli shen|name2?@name2?\.com|GitHub University|Paper Title Number|Teaching experience [12]|exampleurl\.com|Red Brick University|land-expropriated farmers/i)
    errors << "#{path.relative_path_from(root)}: former-owner or demo content"
  end
  documents[path] = Nokogiri::HTML(text)
end

checked = 0
check_url = lambda do |source, raw|
  next if raw.nil? || raw.empty? || raw.start_with?('data:', 'mailto:', 'tel:', 'javascript:')
  begin
    url = URI.join("#{origin}#{prefix}/#{source.relative_path_from(root)}", raw)
    next unless url.host == URI(origin).host
    path = CGI.unescape(url.path)
    unless prefix.empty? || path == prefix || path.start_with?("#{prefix}/")
      errors << "#{source.relative_path_from(root)}: missing baseurl in #{raw}"
      next
    end
    path = path.delete_prefix(prefix).sub(%r{^/}, '')
    target = root.join(path).cleanpath
    unless target.to_s.start_with?("#{root}/") || target == root
      errors << "#{source.relative_path_from(root)}: path escapes site: #{raw}"
      next
    end
    target = target.join('index.html') if target.directory?
    checked += 1
    unless target.file?
      errors << "#{source.relative_path_from(root)}: missing target #{raw}"
      next
    end
    fragment = CGI.unescape(url.fragment.to_s)
    if !fragment.empty? && documents.key?(target)
      ids = documents[target].css('[id], a[name]').flat_map { |node| [node['id'], node['name']] }.compact
      errors << "#{source.relative_path_from(root)}: missing fragment #{raw}" unless ids.include?(fragment)
    end
  rescue URI::InvalidURIError => error
    errors << "#{source.relative_path_from(root)}: invalid URL #{raw}: #{error.message}"
  end
end

documents.each do |source, doc|
  doc.css('[href], [src], [poster]').each do |node|
    %w[href src poster].each { |attribute| check_url.call(source, node[attribute]) }
  end
end
root.glob('**/*.css').each do |source|
  source.read.scan(/url\(\s*['"]?([^)'"\s]+)['"]?\s*\)/).flatten.each { |url| check_url.call(source, url) }
end
root.glob('**/*.xml').each do |source|
  Nokogiri::XML(source.read).xpath('//*[local-name()="loc"]').each { |node| check_url.call(source, node.text) }
end
manifest = root.join('images/manifest.json')
JSON.parse(manifest.read).fetch('icons', []).each { |icon| check_url.call(manifest, icon.fetch('src')) }

%w[_template_examples docs scripts markdown_generator].each do |directory|
  errors << "Excluded source directory was published: #{directory}" if root.join(directory).exist?
end
%w[files/CV.pdf files/main.pdf images/profile_square.jpg].each do |path|
  errors << "Former-owner file was published: #{path}" if root.join(path).exist?
end
errors << 'Missing current CV PDF' unless root.join('files/yugen-chen-cv.pdf').file?

abort errors.uniq.join("\n") unless errors.empty?
puts "Verified #{documents.length} HTML pages and #{checked} internal links/assets; YAML/JSON and content checks passed (baseurl: #{prefix.empty? ? '/' : prefix})."
