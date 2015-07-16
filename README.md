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
**Step 1.)** Paste data into dna.txt

```ruby
    open dna.txt
```    

**Step 2.)** Run microhomology on dna.txt

```ruby
    ruby mh.rb
```
    

**Step 3.)** A file will be created containing the results and will be saved as a .json file in **_targets/crispr/_** folder. Additionally, results will be displayed on screen and the file will open immediately using your default text editor.

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
