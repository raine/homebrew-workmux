class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.251"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.251/workmux-darwin-arm64.tar.gz"
      sha256 "5e6ccb0257484ea5c6597ec729ae5366d6e37864346f4e766dca1668dfc2e2e9"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.251/workmux-darwin-amd64.tar.gz"
      sha256 "0b12f7bfb153ffd55b74bbef1e486b84fddf865e1d2ab31995d065c9f90f869b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.251/workmux-linux-arm64.tar.gz"
      sha256 "40cb1459b3cde4e21800f5a8a3d7b760f2f4dc71d185905e82d25b1f2ac63061"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.251/workmux-linux-amd64.tar.gz"
      sha256 "5146cb69aeac3f19149de417bb5f7a2556efb377841c29d36247001aaeede199"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
