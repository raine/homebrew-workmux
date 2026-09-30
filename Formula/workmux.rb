class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.269"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.269/workmux-darwin-arm64.tar.gz"
      sha256 "75456e3bc739aaebfe0a93130d7c0cfd6b5b1912dcfbbe791fab5bb86fc4e622"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.269/workmux-darwin-amd64.tar.gz"
      sha256 "4f8cff2347a984d89d3dfe030dea154698bc34ee9d96aff4c6b34917c035b60c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.269/workmux-linux-arm64.tar.gz"
      sha256 "e4d3fcc30fd52fcc006586fcc97bf43eb0a969ecb7e507a96b577c4ea1e6a5d3"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.269/workmux-linux-amd64.tar.gz"
      sha256 "c1b4ef8b40d38e03910760334301cc1dc77ef95145cd889cc3bc4e573568be1b"
    end
  end

  def install
    bin.install "workmux"
    generate_completions_from_executable(bin/"workmux", "completions")
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
