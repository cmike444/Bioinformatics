require 'rubygems'
require 'bio'

# Opens dna1.txt with ~ 4000 base pairs
# Creates a new Bio::Sequence instance
#     Set to variable "sequence" and uppercased
file = File.open('dna1.txt', 'r')
sequence = Bio::Sequence::NA.new(file.read).upcase

# Counts sequence length (base pairs)
sequence_length = sequence.length
puts "\nSequence is #{sequence_length} base pairs."

# TALEN Regular Expression Pattern 
# Matches "T" at beginning
# "." represents any character {n} times
# Matches ending of "A" after .{45}
talen = /[T].{45}[A]/

# Searches "sequence" for talen pattern
puts "\nSearching for TALEN sites..."
talen_sites = sequence.scan(talen) 

# If TALEN sites found, print them to screen
# Otherwise, print "none found" to the screen
if talen_sites
  puts "\nFound #{talen_sites.length} talen sites from #{sequence_length} base pairs."
  talen_sites.each_with_index do |site, index|
    
    # Turn TALEN site into Bio:Sequence
    site = Bio::Sequence::NA.new(site).upcase

    # Get complement of TALEN Site
    # Reverse and upcase for visual match
    site_complement = site.complement.reverse.upcase

    # Breakdown TALEN Site
    sequence_talen1 = site[0..15]
    sequence_spacer1 = site[16..22]
    sequence_spacer2 = site[23..30]
    sequence_talen2 = site[31..47]

    # Build gene name sequence
    # Create gene name Bio::Sequence
    # Create gene name complement
    genename = Bio::Sequence::NA.new("#{sequence_talen1}#{sequence_spacer2}#{sequence_spacer1}#{sequence_talen2}").upcase
    genename_complement = genename.complement.reverse.upcase

    # Print TALEN results to screen
    puts "\n  #{index+1}.) #{site}\n"
    puts "\n             Wild Type:   #{site}"
    puts "                            #{site_complement}"
    puts "\n             genename:    #{genename}"
    puts "                          #{genename_complement}\n\n"
  end

  File.open("talen_sites.txt", 'a+') {|f| f.write(talen_sites) }
  
else
   #  If no TALEN sites found
  puts "No TALEN sites found."
end
