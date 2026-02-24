class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.123"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.123/workmux-darwin-arm64.tar.gz"
      sha256 "3ea064e744f1a2f946fab524e115c01fb994bdc5015c690e5e2a66f5a4350782"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.123/workmux-darwin-amd64.tar.gz"
      sha256 "15d43cb21867d582cf34b928cf226b862c6a57470cbc4a63d9486aa17406cd87"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.123/workmux-linux-arm64.tar.gz"
      sha256 "c6786e4336a5197c6fd7e7268dfa6518d1b698b46a62e58c059d242f9b128dcf"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.123/workmux-linux-amd64.tar.gz"
      sha256 "f99f317c726eb7c4ebc3a76d7e202948818ceda3b3354a97990378cd47d2f043"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
