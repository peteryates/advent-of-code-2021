class Sheet
  getter points : Array(Tuple(Int32, Int32))
  getter folds : Array(Tuple(String, Int32))

  def initialize(raw : String)
    #@points = Hash(Int32, Int32).new
    @points = [] of Tuple(Int32, Int32)
    @folds = [] of Tuple(String, Int32)

    pd, fd = raw.split("\n\n")

    pd.split("\n").map { |l| l.split(",") }.each do |p|
      @points << {p[1].to_i, p[0].to_i}
    end

    fd.split("\n").each do |f|
      matches = (/fold along (x|y)=(\d+)/).match(f)

      @folds << {matches[1], matches[2].to_i} if matches
    end
  end

  def debug
    height = points.map { |p| p[0] }.max
    width = points.map { |p| p[1] }.max

    (0..height).each_with_index do |y, i|
      print "#{i}:".ljust(4)

      (0..width).each { |x| points.any? { |p| p[0] == y && p[1] == x } ? (print "#") : (print ".") }
      print "\n"
    end
  end

  def fold(count : Int32 | Nil)
    foldable = count ? folds.first(count) : folds

    foldable.each do |f|
      fold_direction = f[0]
      fold_at = f[1]

      if fold_direction == "y"
        @points = points.map { |y, x| y > fold_at ? {y - ((y - fold_at)*2), x} : {y, x} }.uniq
      else
        @points = points.map { |y, x| x > fold_at ? {y, x - ((x - fold_at)*2)} : {y, x} }.uniq
      end
    end
  end

  def visible_points
    points.size
  end
end
