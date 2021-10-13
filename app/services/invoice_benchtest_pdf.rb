require 'benchmark'
class InvoiceBenchtestPdf

  TIMES = 10

  def call
    # Decided not to use Benchmark gem because it seemed to be giving inaccurate results. I don't think the
    # ActionController rendering operation was getting recorded in the experiment time recording.
    #
    Benchmark.bm do |b|
      b.report('Wicked') { TIMES.times { GenerateInvoicePdfWicked.new.call() } }
      b.report('Grover') { TIMES.times { GenerateInvoicePdfGrover.new.call() } }
    end
  end
end