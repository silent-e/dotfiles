class Bootstrap

  def do_sync
    _do_sync(dry_run: false) do |result|
      if result.success?
        puts _color.decorate('Success!', :green)
      else
        puts _color.decorate('Something went wrong!', :red)
      end
    end
  end

  def list_files
    ap _changed_files
  end

  def show_diffs
    files = _changed_files

      files.each do |file|
        puts _color.decorate("diff for #{file}", :cyan, :underline)
        puts Diffy::Diff.new(File.expand_path("~/#{file}"), file, source: 'files', context: 4).to_s(:color)
      end
  end

private

  def _color
    @_color ||= ::Pastel.new(enabled: true)
  end

  def _changed_files
    files = ''
    _do_sync do |result|
      if result.success?
        files = result.collect { |line|
          next if line[1] != 'f'
          line.split(' ').last
        }.compact
      else
        puts _color.decorate('Unable to get changed files', :red)
      end
    end
    files
  end

  def _do_sync(dry_run: true)
    dry_run_flag = dry_run ? '--dry-run' : ''
    command = TTY::Command.new #(printer: :null)

    command.run!(:rsync, '--exclude-from=bootstrap_rsync_excludes.txt', dry_run_flag, '-iaO', '--no-perms', '.', File.expand_path('~')).tap do |result|
      yield result
    end
  end

end
