class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.178"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.178/workmux-darwin-arm64.tar.gz"
      sha256 "46858600fc9fede4a15bbc66225886d3a882b60706c56e00f39229d8a43ab1f2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.178/workmux-darwin-amd64.tar.gz"
      sha256 "5c3eda107c8beb1f0e7ea0463223a2860f9d8cd5290f1541e81e1961a398b3bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.178/workmux-linux-arm64.tar.gz"
      sha256 "f415cd981e77d3ae01f1418459d7db5e53dae81420c84c24f0b7ed05f3173009"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.178/workmux-linux-amd64.tar.gz"
      sha256 "34126c3a639d62024bcce36ec30c5640beaff459676f5d3b6a2481dd22c9db3d"
    end
  end

  def install
    bin.install "workmux"

    generate_completions_from_executable(bin/"workmux", "completions", shells: [:bash, :fish, :zsh])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/workmux --version")
  end
end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
