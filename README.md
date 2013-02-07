# OpticalDiff

This gem can check whether HTMLs are optically the same or not by ignoring specified html elements by parsing input as HTML.

## Installation

Add this line to your application's Gemfile:

    gem 'optical_diff'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install optical_diff

## Usage

### Ignore specified html element by css selector or xpath

```ruby
html1 = "<html><body>text</body></html>"
html2 = "<html><body>text<p class = 'random_text'>qwerty</p></body></html>"
diff = OpticalDiff.diff(html1, html2, :ignore => %w(p.random_text'))
diff.changed? #=> false
```

### Replace text

```ruby
html1 = "<html><body><a href='/link?abcde'>text</a></body></html>"
html2 = "<html><body><a href='/link?fghij'>text</a></body></html>"
diff = OpticalDiff.diff(html1, html2, :replace => [[/\?.+?'/, "'"]])
diff.changed? #=> false
```

``:replace`` is always processed before ``:ignore``

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
