class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.111"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.111/workmux-darwin-arm64.tar.gz"
      sha256 "865fdad97a80b8a3b08daf32c354112ae8519b6c38ab6abba5a994eef7619c4e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.111/workmux-darwin-amd64.tar.gz"
      sha256 "6d2ea1498dd8af2cbc98d4c516808add9de10072a1ab1c3ae6aacc7c7cc12e2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.111/workmux-linux-arm64.tar.gz"
      sha256 "285b46e08f72ccee28df78ef571e862f1ef84fadd90259eb232399a7e68ea5ec"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.111/workmux-linux-amd64.tar.gz"
      sha256 "5f18b56a6d4a8e667a86394b4da399056e503ebb1a708183662dcc17b7edaacf"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
