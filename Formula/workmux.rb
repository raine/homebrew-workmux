class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.139"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.139/workmux-darwin-arm64.tar.gz"
      sha256 "eee41eea8fb66f3495948a82bf4bfb088046632160bdf5b8747dfa8f030b8043"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.139/workmux-darwin-amd64.tar.gz"
      sha256 "8b222130fac66b73d95fbcb9b9a54d19b7a49fe89c61136594c4c48c4dc2a4d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.139/workmux-linux-arm64.tar.gz"
      sha256 "82da3dd944d187a533df277f6ee2ec4f23c938d58b2a19086f35fe189cf35a97"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.139/workmux-linux-amd64.tar.gz"
      sha256 "e9491517f02343fa12e608e1a46126dbdad09c5d7c2e8a01845cac93720691b4"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
