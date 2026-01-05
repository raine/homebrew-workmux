class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.69"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.69/workmux-darwin-arm64.tar.gz"
      sha256 "1215a369b4a931b4eefbdc9993281b7f0353fb087ccf9c627fbfc42a97766288"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.69/workmux-darwin-amd64.tar.gz"
      sha256 "ab79a729a851b41c711198215e8a9ba4d6d54d8f63bf23638c905a30bfea53be"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.69/workmux-linux-arm64.tar.gz"
      sha256 "90ddd6e1bccac247b89b2d8edf2c2f5dbc1b3f7e460f7ed382738eb68531c27d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.69/workmux-linux-amd64.tar.gz"
      sha256 "807631dd553223642ca1d15daba4ce0f589fc91b32ebe6af137857fcf343e9f9"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
