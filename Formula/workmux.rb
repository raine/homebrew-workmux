class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.227"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.227/workmux-darwin-arm64.tar.gz"
      sha256 "46331a24c1a3eea13a33920842fa9785cc7a7bc0e1c1569a4bf68adb87cd0019"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.227/workmux-darwin-amd64.tar.gz"
      sha256 "8e2a38a0af0980c304263ab82ca63cfd76b6e9634b4c851f9d994aa0b84d4300"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.227/workmux-linux-arm64.tar.gz"
      sha256 "cfa3c1f25703d49cba2fa63f862fc16309f177be9643a0f8de3cefabc93324ff"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.227/workmux-linux-amd64.tar.gz"
      sha256 "51a5217215e138f2ce303a0ac3035c56f77e2e4dd57a29afc34015c60094f2a3"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
