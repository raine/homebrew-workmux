class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.221"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.221/workmux-darwin-arm64.tar.gz"
      sha256 "c7642b895beb061a1b52ef8fd9c002ad9a922f6206e96c1ed89f18c3052d3edf"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.221/workmux-darwin-amd64.tar.gz"
      sha256 "37a5328b681474427368d5678412f21855381e07a212e556add97f82ac8f8ff9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.221/workmux-linux-arm64.tar.gz"
      sha256 "e241c2ec70e5075f691b5e4b0c57b30369d52d45e689fc8b8b08e1694120d132"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.221/workmux-linux-amd64.tar.gz"
      sha256 "f0a977ca52a4c086d34e4e7c0411b194e63d1a347a1c8017f3443db1ee6f6ad9"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
