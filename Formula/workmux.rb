class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.256"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.256/workmux-darwin-arm64.tar.gz"
      sha256 "0278dcca24e11beacb37fa5377d757a549d6ef1a3692da6a0a3de1c47f658cc0"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.256/workmux-darwin-amd64.tar.gz"
      sha256 "5b367fc24925f57e66a7c0db751b86c48c9723b3eebe703c06698491d7c4ee2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.256/workmux-linux-arm64.tar.gz"
      sha256 "d4c73e3c521af82abcf5fbaafcd21f2115949f8193edff4b1b5698e17a111af2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.256/workmux-linux-amd64.tar.gz"
      sha256 "93a1db4e0c56d33f4919ce7bd25541067dfa10797fc962ddb4ef371513be08c4"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
