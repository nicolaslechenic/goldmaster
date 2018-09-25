RSpec.describe Foo do
  describe '#bar' do
    let(:csv_goldmaster) { CSV.read('spec/fixtures/goldmaster.csv') }

    it 'produce a consistent result' do
      out_path    = 'spec/fixtures/goldmaster.out'
      bar_values  =
        csv_goldmaster.map do |row|
          Foo.new(row[0], row[1], row[2], row[3], row[4]).bar
        end

      if !File.exist?(out_path)
        write_goldmaster(csv_goldmaster, out_path)
      else
        goldmaster_to_ary = CSV.foreach(out_path).map(&:first)

        expect(bar_values).to eql(goldmaster_to_ary)
      end
    end
  end

  def write_goldmaster(csv, path)
    csv.each do |row|
      open(path, 'a') do |f|
        f.puts Foo.new(row[0], row[1], row[2], row[3], row[4]).bar
      end
    end
  end
end
