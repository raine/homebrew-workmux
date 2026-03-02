class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.129"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.129/workmux-darwin-arm64.tar.gz"
      sha256 "94695eff5f8f76c5b1eec1ce666ac7a058412d057a17b097428bda19c05b2cc3"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.129/workmux-darwin-amd64.tar.gz"
      sha256 "d1c9cf6c5c0988d766dc8a6e768f11f6a572246a645cf23162cb98a24304877c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.129/workmux-linux-arm64.tar.gz"
      sha256 "1e2f3eb2a0e34acaf9bb38ee451092cfb3aafa4683401dde5b9d49dc5f1a03ef"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.129/workmux-linux-amd64.tar.gz"
      sha256 "8295fd641ddc58b12d4b108a2f53b9f3a421315655ee4d23332116efda550b49"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
