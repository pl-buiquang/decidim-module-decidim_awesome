# frozen_string_literal: true

module Decidim
  module DecidimAwesome
    module ProposalMCellOverride
      extend ActiveSupport::Concern

      included do
        alias_method :decidim_original_cache_hash, :cache_hash

        def cache_hash
          @cache_hash ||= "#{decidim_original_cache_hash}#{Decidim.cache_key_separator}#{model.extra_fields&.vote_weight_totals}"
        end
      end
    end
  end
end
