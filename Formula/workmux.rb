class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.245"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.245/workmux-darwin-arm64.tar.gz"
      sha256 "722c665805549af8e81bfcdb0bfba415f1efa744c2e96ee12f1be388ab12278b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.245/workmux-darwin-amd64.tar.gz"
      sha256 "dadf9247517529073f5f6c7b88e8d81becc6e4032fd66cfece1132f38becfd1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.245/workmux-linux-arm64.tar.gz"
      sha256 "dd7ea3a9132e5fed5eeb263c01e9c1b03abf775934d42cf6e654323252755181"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.245/workmux-linux-amd64.tar.gz"
      sha256 "963e0cee486e3c11a7ff6d1aab58e0ea1bcd037398f8337d7386d3b684480cf2"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
