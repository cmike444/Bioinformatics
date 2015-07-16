require 'rubygems'
require 'fileutils'
require 'bio'

file = File.open('dna.txt', 'r')
sequence = Bio::Sequence::NA.new(file.read).upcase
puts "Sequence has #{sequence.length} base pairs."

crispr = /[G][G].{19}[G][G]/
crispr_reverse = /[C][C].{19}[C][C]/

puts "Searching both polarities for CRISPR sites..."
polar_5 = sequence.scan(crispr) ? sequence.scan(crispr) : (puts "None found in 5'")
polar_3 = sequence.scan(crispr_reverse) ? sequence.scan(crispr_reverse) : (puts "None found in 3'")
sites = polar_5 + polar_3

if sites
  crispr_directory = "crispr_sites/"
  crispr_file = "#{crispr_directory}crisper-sites-#{Time.now.strftime("%m%d%Y-%M-%S")}.txt"
  FileUtils.mkdir_p(File.dirname(crispr_directory)) 
  File.open(crispr_file, 'w+') {|f| f.write(sites) }
  puts "Found #{sites.length} sites total. #{polar_5.length} sites in 5', #{polar_3.length} sites in 3'\nCRISPR sites exported to #{crispr_file}."
  system("open #{crispr_file}")
else
  puts "No CRISPR sites found."
end
