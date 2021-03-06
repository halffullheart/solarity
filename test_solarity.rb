require 'minitest/autorun'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'solarity'

class TestSunDay < Minitest::Test
  attr_reader :sun_day

  def setup
    @sun_day = Solarity::SunDay.new(
      time: Time.parse('1 April 2004 12:00 UTC'),
      l_w: -5,
      phi: 52
    )
  end

  def test_sun_set
    assert_in_delta(
      DateTime.parse('1 April 2004 18:15 UTC'),
      sun_day.set,
      0.001
    )
  end

  def test_j_date
    assert_equal(2453097, sun_day.j_date)
  end

  def test_n
    assert_equal(1552, sun_day.n)
  end

  def test_m
    assert_in_delta(87.1807, sun_day.m, 0.05)
  end

  def test_w_0
    assert_in_delta(97.4785, sun_day.w_0, 0.01)
  end

  def test_j_transit
    assert_in_delta(2453096.9895, sun_day.j_transit, 0.01)
  end

  def test_j_set
    assert_in_delta(2453097.2606, sun_day.j_set, 0.01)
  end
end
