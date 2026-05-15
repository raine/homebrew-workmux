class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.208"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.208/workmux-darwin-arm64.tar.gz"
      sha256 "302e660958c8fdd5b43f6e10b3ba0950c2b53d2e3ec0a3c401b0bc92a629f40e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.208/workmux-darwin-amd64.tar.gz"
      sha256 "76972416541f8a761a0cc95f1022df03886a55cdafff9f19aff3ee899a94abfe"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.208/workmux-linux-arm64.tar.gz"
      sha256 "c129540b183c10aba21e021041f49c3aa386aef88cc2c63c06822411e87cd79d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.208/workmux-linux-amd64.tar.gz"
      sha256 "eb7dc03c62d3aca44286436d9b31df58bc177ec6c675ffcf8c9b61ef2dff6e01"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
