module Itamae
  class CLI
    class Local
      DEFAULT_OPTIONS = {
        node_json: nil,
        node_yaml: nil,
        dry_run:   false,
        shell:     '/bin/sh',
        log_level: 'info',
      }

      def initialize(args)
        @options = DEFAULT_OPTIONS.dup
        @recipes = parse_options(args)
      end

      def run
        p @options
        p @recipes
      end

      private

      def parse_options(args)
        opt = OptionParser.new
        opt.on('-j VAL', '--node-json=VAL') { |v| @options[:node_json] = v }
        opt.on('-y VAL', '--node-yaml=VAL') { |v| @options[:node_yaml] = v }
        opt.on('-n', '--dry-run') { |v| @options[:dry_run] = v }
        opt.on('--shell=VAL')     { |v| @options[:shell] = v }
        opt.on('--log-level=VAL') { |v| @options[:log_level] = v }
        opt.parse!(args.dup)
      end
    end
  end
end