class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.42/aarch64-apple-darwin.tar.gz"
      sha256 "9efdec9c4b117d285eae8ec9efbabd5d522f43ded331cc5c3802c03b248eedd8"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.42/x86_64-apple-darwin.tar.gz"
      sha256 "be15f927d470142b12f2e7ce98f09fc7d14d83b601d4b5d883f84fddf0ef5f42"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.42/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "132f4009febe1b6f5c0abb451f1aca777d993e0e0a1f3fdd3ace0ef99ed1f91a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.42/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce3da191d6b1a2217360914a00058a136f4add2f7721725d58c1d8502cee71bf"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
