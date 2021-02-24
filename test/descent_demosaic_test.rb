# frozen_string_literal: true

require "test_helper"

class DescentDemosaicTest < Minitest::Test
  def setup
    @input1 = Pathname.new(
      "test/resources/Mars_Perseverance_ESF_0004_0667289069_518ECM_N0010052EDLC00004_0010LUJ01.png"
    )
    @output = Pathname.new("tmp/test.png")
    @output.delete if @output.exist?
  end

  def test_that_it_has_a_version_number
    refute_nil ::DescentDemosaic::VERSION
  end

  def test_it_writes_an_output_file
    demosaicer = DescentDemosaic::Demosaicer.new(@input1, @output)
    demosaicer.run

    assert File.exist?(@output)
  end

  def teardown
    @output.delete if @output.exist?
  end
end
