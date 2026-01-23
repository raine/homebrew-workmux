class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.98"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.98/workmux-darwin-arm64.tar.gz"
      sha256 "1df7d14f19719c9b0e60132100dfe863d8f98dc0c9c36344a5b02eb7bcb3986f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.98/workmux-darwin-amd64.tar.gz"
      sha256 "14dfb47b45354a10f0cf0eb360f01f2fae74e4b8d4f7c3ce63b63ab53feeeee3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.98/workmux-linux-arm64.tar.gz"
      sha256 "5b06a3004581e09628b5afa5f2c395ae7367ec428999b20fb844c9c9581606c7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.98/workmux-linux-amd64.tar.gz"
      sha256 "cb7a9a455d013b4b1430a9a1c8ea351c05f849e9055a8a1db34f029b0e00eabc"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
