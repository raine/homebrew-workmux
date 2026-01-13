class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.89"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.89/workmux-darwin-arm64.tar.gz"
      sha256 "c37b2c9b46d9836596a0fbab4b78004d3152a5c0baa22b68dbe0afb68c7ad09e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.89/workmux-darwin-amd64.tar.gz"
      sha256 "b7ea0e45a01812a9278f97cebb12a31df3e14b64f0a1ca52af0641df0c68f555"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.89/workmux-linux-arm64.tar.gz"
      sha256 "8df43a93329b06d4717056ee3fa76bbc24d5b8d4409d6d85ade962ef0b1f8fef"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.89/workmux-linux-amd64.tar.gz"
      sha256 "54caeacde58241b8a645ad33678222871b8b2b0e31d9cb22c212cb554a264d87"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
