class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.270"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.270/workmux-darwin-arm64.tar.gz"
      sha256 "2b2f978fa11492f9ac92d2259f33d7ac058ebae05f51c4d3fe579b065a1f239c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.270/workmux-darwin-amd64.tar.gz"
      sha256 "dfe7270935efd440c08c65b61100451156e8d06a28c48bf0f27585273be02977"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.270/workmux-linux-arm64.tar.gz"
      sha256 "80c0f660b0f15054efb60d474c799c1a8a9c4dfa1e5e129aefe0ef58c49ec9ff"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.270/workmux-linux-amd64.tar.gz"
      sha256 "b61d6575a2f6e3af14a4ff2ac34faceb7ecfe14bba340cb40a3b0e33e583deaa"
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
