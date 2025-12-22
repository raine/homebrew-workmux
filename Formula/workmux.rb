class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.56/aarch64-apple-darwin.tar.gz"
      sha256 "3c75cbb1f92bbb0452d8515b49fbcf0b9ba7d27d8e535bd7bada98d9942b38da"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.56/x86_64-apple-darwin.tar.gz"
      sha256 "742b32e3d6a18c1a75ed001dd7ba5ccf22d948f25cccc0adcedfc91ad9f8079f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.56/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd1870690e8654a30a5d51972b9bfa5a6df5748ae6d9b445ed8ed78178479491"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.56/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a1bbadfb903b9429a2599cf95b7fa57e90ceae5f52fd8c292c01f453ec94659"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
