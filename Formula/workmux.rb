class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.70"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.70/workmux-darwin-arm64.tar.gz"
      sha256 "033741378b64291f5bbdd07bf069816ffda7bcf2fef2a4c710b59696a044d11b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.70/workmux-darwin-amd64.tar.gz"
      sha256 "5160fb0e6b08fd0770ac267d02fda25ce59c82a5631a049e6feb2a4e243407d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.70/workmux-linux-arm64.tar.gz"
      sha256 "2a4cb5140da8424035b92eebf6f1375cdb0373cfb663530599dcb28ecae7cc16"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.70/workmux-linux-amd64.tar.gz"
      sha256 "5b15629c0a0e634432f69e41dadf05ec9f9bef9492a9e109dcaaa666b5f92377"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
