class Bootstrap

  attr_reader :changes

  def initialize
    @changes = _load_changes
    @_previewed = false
  end

  def ask_what_to_do
    list_changed_files
    _prompt.select(_color.decorate("\nWhat do you want to do?", :yellow)) do |menu|
      menu.enum '.'
      menu.default (@_previewed ? 2 : 1)
      menu.choice 'Preview', 'preview'
      menu.choice 'Sync Files', 'sync'
      menu.choice 'Exit', 'exit'
    end
  end

  def do_sync
    _do_sync(dry_run: false) do |result|
      if result.success?
        puts _color.decorate('Success!', :green)
      else
        puts _color.decorate("Something went wrong! Here's the error…", :red)
        puts result.err
      end
    end
  end

  def list_changed_files
    puts _color.decorate('The following files are different…', :blue)
    _output_simple_changed_file_list
  end

  def show_diffs
    changes.each do |file|
      puts _color.decorate("diff for #{file}", :cyan, :underline)
      puts Diffy::Diff.new(File.expand_path("~/#{file}"), file, source: 'files', context: 4).to_s(:color)
    end
    @_previewed = true
  end

  def stop
    puts _color.decorate('Exiting', :green)
  end

private

  def _color
    @_color ||= ::Pastel.new(enabled: true)
  end

  def _load_changes
    [].tap do |files|
      _do_sync do |result|
        if !result.success?
          puts _color.decorate('Unable to get changed files', :red)
          return
        end

        result.each do |line|
          files << line.split(' ').last if line[1] == 'f'
        end
      end
    end.compact
  end

  def _output_simple_changed_file_list
    changes.map do |file| puts file end
  end

  def _do_sync(dry_run: true)
    dry_run_flag = dry_run ? '--dry-run' : ''
    command = TTY::Command.new(printer: :null)

    command.run!(:rsync, '--exclude-from=bootstrap_rsync_excludes.txt', dry_run_flag, '-iaO', '--no-perms', '.', File.expand_path('~')).tap do |result|
      yield result
    end
  end

  def _prompt
    @_prompt ||= TTY::Prompt.new
  end

end
