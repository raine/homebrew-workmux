class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.255"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.255/workmux-darwin-arm64.tar.gz"
      sha256 "a2d8be29c8d6700bcf93bc6906f8a3e106cabd550898275d4b4a3e1037e51ee7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.255/workmux-darwin-amd64.tar.gz"
      sha256 "11209e87b0ae51dd2ad1453420b175ca82fbe413742f1d356279bcdf7acc5d15"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.255/workmux-linux-arm64.tar.gz"
      sha256 "5224edf51af891449008083319602f99d183577eeaff9bf9730640084513f228"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.255/workmux-linux-amd64.tar.gz"
      sha256 "73570a1445cde4cbb8f1f99b14348102b13435fc0f4f3e3303003e69ab12da6a"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
