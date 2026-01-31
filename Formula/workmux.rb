class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.104"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.104/workmux-darwin-arm64.tar.gz"
      sha256 "eece2d686765aad866d2e1b8d066ee6eb20646fd63c53ba8fa2ab2cd97654828"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.104/workmux-darwin-amd64.tar.gz"
      sha256 "54b36afbb5fadd198332a1287483fc00b426564f1c16e45618157b606cfa67e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.104/workmux-linux-arm64.tar.gz"
      sha256 "3252a1167dade302bdf240c53e9c9f22d6a910f43b144d3b8f2e86920dd24155"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.104/workmux-linux-amd64.tar.gz"
      sha256 "693e1be09c65eedafee516e54d81114469a20ab11f5dbcdf3e8fda46cc4e8562"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
