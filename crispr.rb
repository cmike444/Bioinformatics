require 'rubygems'
require 'bio'

# Opens dna.txt with ~ 4000 base pairs
# Creates a new Bio::Sequence instance
#     Set to variable "sequence" and uppercased
file = File.open('dna.txt', 'r')
sequence = Bio::Sequence::NA.new(file.read).upcase

# Counts sequence length (base pairs)
sequence_length = sequence.length
puts " "
puts "Sequence is #{sequence_length} base pairs."

# CRISPR Regular Expression Pattern
# Matches "GG" at beginning
# "." represents any character {n} times
# Matches ending of "GG" after .{19}
crispr = /[G][G].{19}[G][G]/

# Searches "sequence" for CRISPR pattern
puts " "
puts "Searching for CRISPR sites..."
crispr_sites = sequence.scan(crispr)

# If CRISPR sites found, print them to screen
# Otherwise, print "none found" to the screen
if crispr_sites
  puts "Found #{crispr_sites.length} CRISPR sites from #{sequence_length} base pairs."
  crispr_sites.each_with_index do |site, index|
    
    # Turn CRISPR site into Bio:Sequence
    site = Bio::Sequence::NA.new(site).upcase

    # Get complement of CRISPR Site
    # Reverse and upcase for visual match
    site_complement = site.complement.reverse.upcase

    # Print CRISPR results to screen
    puts " "
    puts "  #{index+1}.) #{site}"
    puts " "
  end
else
  #  If no CRISPR sites found
  puts "No CRISPR sites found."
end
