# Microhomolgy
Useful tools written in ruby to aid microhomology research for genetic engineering.

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
Paste data into dna.txt

```ruby
    open dna.txt
```    

Tweak microhomology strategy

```ruby
    # The microhomology strategy
    mh_strategy = [6, 9, 12, 24, 48, 60]
```

Run microhomology on dna.txt. Script searches for target sites on both forward and reverse strands.

```ruby
    ruby crispr.rb
```

A JSON file containing the results will be saved in **_targets/crispr/_** folder. Additionally, results will be displayed in the console and will opened immediately by your default text editor.

```javascript
    [{
    "target": "GGCCGATTCATTAATGCAGCTGG",
    "first": 155,
    "last": 178,
    "microhomology": [
      {
        "strategy": "mh6",
        "forward_strand": "TAATGC",
        "reverse_strand": "ATTACG",
        "mh6_oligo_forward": "TAATGCAGCTGG",
        "mh6_oligo_reverse": "ATTACGTCGACC"
      },
      {
        "strategy": "mh9",
        "forward_strand": "CATTAATGC",
        "reverse_strand": "GTAATTACG",
        "mh9_oligo_forward": "CATTAATGCAGCTGG",
        "mh9_oligo_reverse": "GTAATTACGTCGACC"
      },
      {
        "strategy": "mh12",
        "forward_strand": "ATTCATTAATGC",
        "reverse_strand": "TAAGTAATTACG",
        "mh12_oligo_forward": "ATTCATTAATGCAGCTGG",
        "mh12_oligo_reverse": "TAAGTAATTACGTCGACC"
      },
      {
        "strategy": "mh24",
        "forward_strand": "GCGCGTTGGCCGATTCATTAATGC",
        "reverse_strand": "CGCGCAACCGGCTAAGTAATTACG",
        "mh24_oligo_forward": "GCGCGTTGGCCGATTCATTAATGCAGCTGG",
        "mh24_oligo_reverse": "CGCGCAACCGGCTAAGTAATTACGTCGACC"
      },
      {
        "strategy": "mh48",
        "forward_strand": "CCAATACGCAAACCGCCTCTCCCCGCGCGTTGGCCGATTCATTAATGC",
        "reverse_strand": "GGTTATGCGTTTGGCGGAGAGGGGCGCGCAACCGGCTAAGTAATTACG",
        "mh48_oligo_forward": "CCAATACGCAAACCGCCTCTCCCCGCGCGTTGGCCGATTCATTAATGCAGCTGG",
        "mh48_oligo_reverse": "GGTTATGCGTTTGGCGGAGAGGGGCGCGCAACCGGCTAAGTAATTACGTCGACC"
      }
    ]
  }]
```
