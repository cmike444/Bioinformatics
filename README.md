# Bioinformatics
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

Run microhomology on dna.txt

```ruby
    ruby mh.rb
```

A .json file containing the results will be saved in **_targets/crispr/_** folder. Additionally, results will be displayed on screen in the console and the .json file will open immediately using your default text editor.

```javascript
    [{
    "crispr": "CCCAATACGCAAACCGCCTCTCC",
    "first": 123,
    "last": 146,
    "microhomology": [
      {
        "strategy": "MH6",
        "first": 116,
        "last": 122,
        "mh_5": "AAGAGCG",
        "mh_3": "TTCTCGC"
      },
      {
        "strategy": "MH9",
        "first": 113,
        "last": 122,
        "mh_5": "CGGAAGAGCG",
        "mh_3": "GCCTTCTCGC"
      },
      {
        "strategy": "MH12",
        "first": 110,
        "last": 122,
        "mh_5": "AAGCGGAAGAGCG",
        "mh_3": "TTCGCCTTCTCGC"
      },
      {
        "strategy": "MH24",
        "first": 98,
        "last": 122,
        "mh_5": "CAGTGAGCGAGGAAGCGGAAGAGCG",
        "mh_3": "GTCACTCGCTCCTTCGCCTTCTCGC"
      },
      {
        "strategy": "MH48",
        "first": 74,
        "last": 122,
        "mh_5": "GCCGAACGACCGAGCGCAGCGAGTCAGTGAGCGAGGAAGCGGAAGAGCG",
        "mh_3": "CGGCTTGCTGGCTCGCGTCGCTCAGTCACTCGCTCCTTCGCCTTCTCGC"
      },
      {
        "strategy": "MH60",
        "first": 62,
        "last": 122,
        "mh_5": "CCGCTCGCCGCAGCCGAACGACCGAGCGCAGCGAGTCAGTGAGCGAGGAAGCGGAAGAGCG",
        "mh_3": "GGCGAGCGGCGTCGGCTTGCTGGCTCGCGTCGCTCAGTCACTCGCTCCTTCGCCTTCTCGC"
      }
    ]
  }]
```
