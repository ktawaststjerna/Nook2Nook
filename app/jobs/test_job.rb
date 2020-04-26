class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    case args[0]
    when 'test1'
      sleep 20
      puts 'hard job man'
    when 'test2'
      sleep 10
      puts 'slightly hard but not bad'
    else
      sleep 1
      puts 'not too bad'
    end
  end
end
