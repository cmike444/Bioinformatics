require 'rubygems'
require 'fileutils'
require 'json'
require 'bio'

# Read DNA from .txt, create new Bio::Sequence
file = File.open('exon.txt', 'r')
frame = 1
c = "CCCGGCGGATTTGTCCTACTCAG"
mh_length = 12
targeting_vector = "GFP"
sequence = Bio::Sequence::NA.new(file.read).upcase

# Initialize targets
target = []

sequence.scan(/#{c}/) do |c|
  # Compile first set of data to JSON
  target << {
              "crispr" => c,
              "first" => Regexp.last_match.offset(0).first, 
              "last" => Regexp.last_match.offset(0).last,
              "microhomology" => []
            }
end

if target
  if target[0]["crispr"][0..1] = "CC"
    five_prime_last_char = target[0]["first"] + 5
    five_prime_first_char = five_prime_last_char - (mh_length - 1)
    three_prime_first_char = target[0]["first"] + 6
    three_prime_last_char = three_prime_first_char + (mh_length - 1)
  end

  case frame
  when 0
    char_index = sequence.index(c)
  when 1
    sequence.slice!(0..1)
    char_index = sequence.index(c)
  when 2
    sequence.slice!(0)
    char_index = sequence.index(c)
  else
    p "Help"
  end

  p char_index
  frame_divider = (char_index).to_f / 3.00
  frame_pct = frame_divider.to_s.scan(/.\d{2}/)[0]
    
  if frame_pct == ".33"
    frame_sequence = "NN"
  elsif frame_pct == ".66"
    frame_sequence = "N"
  else
    frame_sequence = ""
  end

  # Output target information
  target[0]["microhomology"] << { 
    "homology_length" => "mh#{mh_length}",
    "mh#{mh_length}_five_prime_oligo_forward" => ("aattc" + sequence[five_prime_first_char..five_prime_last_char].to_s + frame_sequence.to_s + "g").upcase,
    "mh#{mh_length}_five_prime_oligo_reverse" => ("g" + frame_sequence.to_s + sequence[five_prime_first_char..five_prime_last_char].complement.to_s + "ctagg").upcase,
    "mh#{mh_length}_three_prime_oligo_forward" => ("catgg" + sequence[three_prime_first_char..three_prime_last_char].to_s + "c" ).upcase,
    "mh#{mh_length}_three_prime_oligo_reverse" => ("c" + sequence[three_prime_first_char..three_prime_last_char].complement.to_s + "gccgg" ).upcase 
  }

else
  p "CRISPR not found in Exon. Please try again."
end

  
  # CRISPR target file path
  crispr_file = "targets/crispr/crisper-#{Time.now.strftime("%m%d%Y-%M-%S")}.json"
  
  # Unless /targets/crispr folders exist, create them
  FileUtils.mkdir_p("targets/crispr") unless Dir.exists?("targets/crispr")

  # Write targets in file. If it doesn't exist, create it
  File.open(crispr_file, 'w+') {|f| f.write(JSON.pretty_generate(target)) }
  puts "Found #{target.length} targets.\nTargets exported to #{crispr_file}."
  
  # Print targets to screen and open file in default text editor
  puts JSON.pretty_generate(target)
  system("open #{crispr_file}")
