describe './bin/parser executing a CLI Application' do
  context "call the cli parser sorted based on views" do
    it 'with parser alias' do
      expect { run_cli("./bin/parser", 'parser', '--file_path=./spec/fixtures/webserver.log') }.to output(
        a_string_including(
          File.read("./spec/fixtures/webserver_parsed_result.txt")
        )
      ).to_stdout_from_any_process
    end

    it 'with -p alias' do
      expect { run_cli("./bin/parser", '-p', '--file_path=./spec/fixtures/webserver.log') }.to output(
        a_string_including(
          File.read("./spec/fixtures/webserver_parsed_result.txt")
        )
      ).to_stdout_from_any_process
    end

    it 'with --p alias' do
      expect { run_cli("./bin/parser", '--p', '--file_path=./spec/fixtures/webserver.log') }.to output(
        a_string_including(
          File.read("./spec/fixtures/webserver_parsed_result.txt")
        )
      ).to_stdout_from_any_process
    end

    it 'with --parser alias' do
      expect { run_cli("./bin/parser", '--parser', '--file_path=./spec/fixtures/webserver.log') }.to output(
        a_string_including(
          File.read("./spec/fixtures/webserver_parsed_result.txt")
        )
      ).to_stdout_from_any_process
    end
  end

  context "call the cli parser sorted based on uniq views" do
    it 'with parser alias' do
      expect { run_cli("./bin/parser", 'parser', '--file_path=./spec/fixtures/webserver.log', '--uniq=true') }.to output(
        a_string_including(
          File.read("./spec/fixtures/webserver_parsed_uniq_result.txt")
        )
      ).to_stdout_from_any_process
    end

    it 'with -p alias' do
      expect { run_cli("./bin/parser", '-p', '--file_path=./spec/fixtures/webserver.log', '--uniq=true') }.to output(
        a_string_including(
          File.read("./spec/fixtures/webserver_parsed_uniq_result.txt")
        )
      ).to_stdout_from_any_process
    end

    it 'with --p alias' do
      expect { run_cli("./bin/parser", '--p', '--file_path=./spec/fixtures/webserver.log', '--uniq=true') }.to output(
        a_string_including(
          File.read("./spec/fixtures/webserver_parsed_uniq_result.txt")
        )
      ).to_stdout_from_any_process
    end

    it 'with --parser alias' do
      expect { run_cli("./bin/parser", '--parser', '--file_path=./spec/fixtures/webserver.log', '--uniq=true') }.to output(
        a_string_including(
          File.read("./spec/fixtures/webserver_parsed_uniq_result.txt")
        )
      ).to_stdout_from_any_process
    end
  end
end