module Orcid

  module XmlScrubber
    
    # Using the xml, loop through the elements and replace the orig_character with new_character
    def scrub(xml, orig_character, new_character, namespace_name, namespace_url)
     
      #Create a Nokogiri document
      xml_doc = Nokogiri::XML(xml)

      #get all nodes
      if namespace_name && namespace_url
        node_set  = xml_doc.xpath( "//#{namespace_name}:*", namespace_name => namespace_url )
        node_set += xml_doc.xpath( "//#{namespace_name}:*/@*", namespace_name => namespace_url )
      else
        node_set  = xml_doc.xpath( "//*" )
        node_set += xml_doc.xpath( "//*/@*" )
      end

      node_set.each do |node|

        # rename the node if it has the character that needs replacing
        if node.node_name.include? orig_character
          node.name = node.name.gsub(orig_character, new_character)
        end
      end

      xml_doc.to_s

    end  
  end
end

