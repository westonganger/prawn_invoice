# Prawn Invoice

<a href="https://badge.fury.io/rb/prawn_invoice" target="_blank"><img height="21" style='border:0px;height:21px;' border='0' src="https://badge.fury.io/rb/prawn_invoice.svg" alt="Gem Version"></a>
<a href='https://travis-ci.org/westonganger/prawn_invoice.rb' target='_blank'><img height='21' style='border:0px;height:21px;' src='https://travis-ci.org/westonganger/prawn_invoice.rb.svg?branch=master' border='0' alt='Build Status'></a>
<a href='https://rubygems.org/gems/prawn_invoice.rb' target='_blank'><img height='21' style='border:0px;height:21px;' src='https://ruby-gem-downloads-badge.herokuapp.com/prawn_invoice?label=rubygems&type=total&total_label=downloads&color=brightgreen' border='0' alt='RubyGems Downloads' /></a>
<a href='https://ko-fi.com/A5071NK' target='_blank'><img height='22' style='border:0px;height:22px;' src='https://az743702.vo.msecnd.net/cdn/kofi1.png?v=a' border='0' alt='Buy Me a Coffee'></a>

Dead simple Prawn based PDF invoice generator with support for custom invoice templates

- Dead simple setup and configuration 
- PDF Export
- Custom Templates
- Optional Rails Integration

## Usage

```ruby
@data = {}

File.write("path/to/invoice.pdf", wb) do |f|
  f.write PrawnInvoice.to_pdf(data: @data)
end

PrawnInvoice.to_pdf_file(filename: "path/to/invoice.pdf", data: @data)
```

Or use in your Rails controllers

```ruby
class InvoiceController < ApplicationController
  def index
    @posts = Post.order(published_at: :asc)

    render pdf: PrawnInvoice.to_pdf(data: @data)
  end
```

# Custom Templates

Custom templates classes can be implemented using the following template as an example:

[PrawnInvoice::Templates::Default - lib/prawn_invoice/templates/default.rb](https://github.com/westonganger/prawn_invoice/blob/master/lib/prawn_invoice/templates/default.rb)

Once implemented use it like so:

```ruby
PrawnInvoice.to_pdf(data: @data, template: :default)

# OR

PrawnInvoice.to_pdf( data: @data, template: PrawnInvoice::Templates::Default)
```

# Credits

Created & Maintained by [Weston Ganger](https://westonganger.com) - [@westonganger](https://github.com/westonganger)

For any consulting or contract work please contact me via my company website: [Solid Foundation Web Development](https://solidfoundationwebdev.com)

[![Solid Foundation Web Development Logo](https://solidfoundationwebdev.com/logo-sm.png)](https://solidfoundationwebdev.com)
