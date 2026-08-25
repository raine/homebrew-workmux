class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.247"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.247/workmux-darwin-arm64.tar.gz"
      sha256 "bf6509a2a9e062faf051a97f494c319a2cf412a0745662770e396d880d571607"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.247/workmux-darwin-amd64.tar.gz"
      sha256 "6a678209c0ebe6a03f93756e500b8725d58528550b3b5371e7d5632c1118c28a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.247/workmux-linux-arm64.tar.gz"
      sha256 "89fe61f2d37b52bb01edbe70d51e7b05d16a3c5f963a2e000ba416db62893f07"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.247/workmux-linux-amd64.tar.gz"
      sha256 "bf632e22aa778d4e47d45c0a36112b7930d37d07008cd46510bd85270f6c8d13"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
