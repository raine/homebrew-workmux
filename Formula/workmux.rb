class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.273"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.273/workmux-darwin-arm64.tar.gz"
      sha256 "67456059204017b05755deec3c16013a13f286852c66b05dc7b07db68b4b75d6"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.273/workmux-darwin-amd64.tar.gz"
      sha256 "df4e4b84c48dc723070a7716e576650d6d2e5ab8675fa5ee6749ae0fc842b4e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.273/workmux-linux-arm64.tar.gz"
      sha256 "1b52e24edcea5c6f5a52ca9a9022c42b3acdb9693a928ffe1f8fff4ab05c760c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.273/workmux-linux-amd64.tar.gz"
      sha256 "b7bea005b56c91745480d727f39cdf8a14bc1aaf6ca0f9474f1e84d9c7682554"
    end
  end

  def install
    bin.install "workmux"
    generate_completions_from_executable(bin/"workmux", "completions")
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
