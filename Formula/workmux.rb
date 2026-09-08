class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.259"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.259/workmux-darwin-arm64.tar.gz"
      sha256 "52e7ade5496e653d8e263a334901670f9aaf6501a47de9ff83d978a786748a6c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.259/workmux-darwin-amd64.tar.gz"
      sha256 "d2db4e021c79acd1c5cd27472d432483e88eb77c25430ac5c9ba7ac76ae334c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.259/workmux-linux-arm64.tar.gz"
      sha256 "1c4ddcb1c9805be4b11d4d86d8cb5484b108f94fb5e84e73f8ebc29fe1126f3e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.259/workmux-linux-amd64.tar.gz"
      sha256 "40010190e4c57ceda177babd05427e41d5d5eb353124936acd271e8460ca11bd"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
