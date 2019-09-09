# module SoccerSeason
#   module Domain
#     module Matches
#       class Match
#         module DomainSupport
#           require_relative to_s.split('::')[-2].underscore.downcase + '/repository'
#           TYPES = %w[
#             commands services invariants factories queries events subscribers
#             repository
#           ].freeze

#           LOADERS = [
#             Support::Factories::FactoryLoader,
#             Support::Invariants::InvariantLoader,
#             Support::Commands::CommandLoader,
#             Support::Queries::QueryLoader
#           ].freeze

#           TYPES.each do |name|
#             Dir[File.dirname(__FILE__) + "/#{to_s.split('::')[-2].underscore.downcase}/#{name}/*.rb"].each do |file|
#               require_relative file
#             end
#           end

#           def self.included(base)
#             LOADERS.each { |loader| base.include(loader) }
#           end
#         end
#       end
#     end
#   end
# end
