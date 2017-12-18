module TutsPostList
  class Generator < Jekyll::Generator
    def generate(site)

      puts "Collect tuts links"
      topics = site.collections['topic'].docs.sort_by { |s| s.data['order'] }
      tutorials = site.collections['tutorials'].docs.group_by{ |s| s.data['topic'] }

      tuts = Array.new

      topics.each do |topic|
        tuts.push(topic.url)
        slug = topic.data['slug']

        tutorials[slug].each { |item| tuts.push(item.url) }

      end
      site.data['tuts_links'] = tuts

    end
  end
end