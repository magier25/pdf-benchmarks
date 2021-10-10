require 'benchmark'
class InvoiceBenchtestPdf

  TIMES = 10

  def call
    # Decided not to use Benchmark gem because it seemed to be giving inaccurate results. I don't think the
    # ActionController rendering operation was getting recorded in the experiment time recording.
    #
    Benchmark.bm do |b|
#      b.report('Wicked') { TIMES.times { GenerateInvoicePdfWicked.new.call() } }
      b.report('Grover') { TIMES.times { GenerateInvoicePdfGrover.new.call() } }
    end
    #

    #%w(Wicked Grover).map do |word|

    # %w(Grover).map do |word|
    #   start = Time.current
    #   TIMES.times { "GenerateInvoicePdf#{word}".constantize.new.call() }
    #   elapsed = Time.current - start

    #   OpenStruct.new(
    #     label: word,
    #     time_elapsed: elapsed.round(6)
    #   )
    # end
  end
end