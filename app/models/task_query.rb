class TaskQuery
  delegate :all, :group_by, :each_with_index, :each, :to_a, to: :@q
  attr_reader :q

  def initialize(query = Task.all, &block)
    @q = query
    query(&block) if block_given?
  end

  def query(&block)
    instance_eval(&block)
    self
  end

  def build(&block)
    yield(self) if block_given?
    self
  end

  def status(value)
    @q = @q.where(status: value)
  end

  def from(time)
    time = to_time(time).beginning_of_day
    @q = @q.where(t[:scheduled_to].gt(time))
  end

  def to(time)
    time = to_time(time).end_of_day
    @q = @q.where(t[:scheduled_to].lt(time))
  end

  def matches(value)
    where = t[:name].matches("%#{value}%").or(t[:description].matches("%#{value}%"))
    @q = @q.where(where)
  end

  private
    def t
      @arel_table ||= Task.arel_table
    end

    def to_date(value)
      case value
        when Date, Time
          value.to_date
        when String
          Date.parse(value)
      end
    end

    def to_time(value)
      case value
        when Date, Time
          value.to_time
        when String
          Date.parse(value)
      end
    end

end