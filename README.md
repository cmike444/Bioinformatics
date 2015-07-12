# Bioinformatics
Useful tools written in ruby to aid research with DNA and genetics engineering.

**Step 1.)** Clone the repository 

    git clone https://github.com/cmike444/Bioinformatics.git
    cd Bioinformatics

From inside the Bioinformatics folder, you can run any ruby scripts.

**Step 2.)** Fill dna.txt with correct data

**Step 3.)** Run scripts on dna.txt
  
    ruby talen.rb
    
    # Searching for TALEN sites...
    #
    # Found 53 talen sites from 3531 base pairs.
    #
    # 1.) TCCCCTGATTCTGTGGATAACCGTATTACCGCCTTTGAGTGAGCTGA
    #
    #         Wild Type: TCCCCTGATTCTGTGGATAACCGTATTACCGCCTTTGAGTGAGCTGA
    #                    AGGGGACTAAGACACCTATTGGCATAATGGCGGAAACTCACTCGACT
    #
    #         Oca2:      TCCCCTGATTCTGTGGTATTACCGATAACCGCCTTTGAGTGAGCTGA
    #                    AGGGGACTAAGACACCATAATGGCTATTGGCGGAAACTCACTCGACT

    ruby crispr.rb

**Step 4.)** Find results in script *name*_sites.txt