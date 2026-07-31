class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.232"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.232/workmux-darwin-arm64.tar.gz"
      sha256 "646b3427393397cba7173340f4e414fa055fe33f5a1d7858aa66118efb8172b6"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.232/workmux-darwin-amd64.tar.gz"
      sha256 "2538c98ab36b03a435d00933926f740f11c7fc1117fb2e30e93c9e748fcea0ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.232/workmux-linux-arm64.tar.gz"
      sha256 "42f5ca9708a7fc1539623f11af12845e50b7335fa16788392b5628a653e8e325"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.232/workmux-linux-amd64.tar.gz"
      sha256 "82608dde56c3054cb9697434d9a2bdd6c8bcfbf6201da08443bd9a80eb4664ed"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
