class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.108"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.108/workmux-darwin-arm64.tar.gz"
      sha256 "ba387dfeb77d7060a7f76419d8254ba5c50a82e0600aefa55646da13577f13c2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.108/workmux-darwin-amd64.tar.gz"
      sha256 "33d78c59401d34b05abbf938bea41de179ab3d3ef9f3cd80173fbe7c76d657ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.108/workmux-linux-arm64.tar.gz"
      sha256 "ab98abb1117e64a34dffe5007711ea5bd31e115063fe46582be696dd4ecaec5d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.108/workmux-linux-amd64.tar.gz"
      sha256 "751f1e73e1eb319a9357e12847dbe0a3bd594b2b21178754ce240dc2eddc7c66"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
