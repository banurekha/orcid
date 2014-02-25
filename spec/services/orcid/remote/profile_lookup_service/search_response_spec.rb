require 'spec_helper'
require 'app/services/orcid/remote/profile_lookup_service/search_response'

module Orcid::Remote
  describe ProfileLookupService::SearchResponse do
    Given(:attributes) { {id: 'Hello', label: 'World', junk: 'JUNK!'} }
    Given(:search_response) { described_class.new(attributes) }
    Then { expect(search_response.id).to eq(attributes[:id]) }
    And { expect(search_response.label).to eq(attributes[:label]) }
    And { expect(search_response.orcid_profile_id).to eq(attributes[:id]) }
    And { expect{search_response.junk }.to raise_error }
  end
end
