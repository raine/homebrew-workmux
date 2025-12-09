class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.47/aarch64-apple-darwin.tar.gz"
      sha256 "48083dc9aea06c4c1f3e87b03fb3bf4b7524dd9f8082a86dee3b76d56b7178dd"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.47/x86_64-apple-darwin.tar.gz"
      sha256 "869644b58e1bd0cb2a38323b71cfb56bbeee029643c96dc3bb6ca19c8edefeff"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.47/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc9ac40070c3531014a32e52213136cd561f0f207133804ff6daea687ca8ca1c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.47/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb10073fea820e4dada8106305dfa7b993020b96c0d017aa161c6cd0e0c8c221"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
