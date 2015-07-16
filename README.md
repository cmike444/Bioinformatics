# Bioinformatics
Useful tools written in ruby to aid research with DNA and genetics engineering.

## Getting Setup

Install Bio gem
```ruby
    gem install bio
```

Clone the repository 
```ruby
    git clone https://github.com/cmike444/Bioinformatics.git
    cd Bioinformatics
```

## Workflow
**Step 1.)** Fill dna.txt with correct data

```ruby
    open dna.txt
```    

**Step 2.)** Run scripts on dna.txt

```ruby

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

    # Searching for CRISPR sites...
    #
    # Found 13 CRISPR sites from 3531 base pairs.

    # 1.) GGCCGATTCATTAATGCAGCTGG


    ruby mh.rb
```javascript
    [{
        "prime": true,
        "first": 155,
        "last": 178,
        "crispr": "GGCCGATTCATTAATGCAGCTGG",
        "microhomology": [
          {
            "first": 148,
            "last": 154,
            "mh6": "GCGCGTT"
          },
          {
            "first": 145,
            "last": 154,
            "mh9": "CCCGCGCGTT"
          },
          {
            "first": 142,
            "last": 154,
            "mh12": "CTCCCCGCGCGTT"
          },
          {
            "first": 130,
            "last": 154,
            "mh24": "CGCAAACCGCCTCTCCCCGCGCGTT"
          },
          {
            "first": 106,
            "last": 154,
            "mh48": "GAGGAAGCGGAAGAGCGCCCAATACGCAAACCGCCTCTCCCCGCGCGTT"
          }
        ]
      }]
```
    
    

```

**Step 3.)** Results open in text editor and save to .txt file in Sites/ folder

```ruby
["TCCCCTGATTCTGTGGATAACCGTATTACCGCCTTTGAGTGAGCTGA", ...]
```
